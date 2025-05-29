let systemPrompt = "";

window.addEventListener("DOMContentLoaded", async () => {
    try {
        const response = await fetch("static/prompt/prompt.txt");
        systemPrompt = await response.text();
    } catch (error) {
        console.error("Lỗi khi tải prompt.txt:", error);
        alert("Không thể tải prompt. Hãy kiểm tra file prompt.txt.");
    }
});

async function sendMessage() {
    const inputBox = document.getElementById("userInput");
    const message = inputBox.value.trim();
    if (!message) return;

    const chatbox = document.getElementById("chatbox");

    // ✅ Thêm tin nhắn người dùng với kiểu bubble chat
    chatbox.innerHTML += `
        <div class="message user" data-sender="Bạn">${message}</div>
    `;
    inputBox.value = "";

    try {
        const response = await fetch("https://api.together.xyz/v1/chat/completions", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer 18b38f3a872d5ecfed03e593cfc1bec12f4342aaf326855c11655a4ae493101b"
            },
            body: JSON.stringify({
                model: "meta-llama/Llama-3.3-70B-Instruct-Turbo-Free",
                messages: [
                    { role: "system", content: systemPrompt },
                    { role: "user", content: message }
                ],
                temperature: 0.3,
                max_tokens: 500
            })
        });

        const result = await response.json();
        const botReply = result?.choices?.[0]?.message?.content || "❌ Không có phản hồi từ mô hình.";

        // ✅ Thêm phản hồi của bot với kiểu bubble chat
        chatbox.innerHTML += `
            <div class="message bot" data-sender="Bot">${botReply}</div>
        `;
    } catch (error) {
        chatbox.innerHTML += `
            <div class="message bot" data-sender="Bot">⚠️ Lỗi khi gọi API: ${error.message}</div>
        `;
    }

    // ✅ Cuộn xuống cuối khung chat
    chatbox.scrollTop = chatbox.scrollHeight;
}

function toggleChat() {
    const chatContainer = document.getElementById("chatContainer");
    chatContainer.style.display = chatContainer.style.display === "none" ? "flex" : "none";
}
