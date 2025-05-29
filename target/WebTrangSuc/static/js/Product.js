
function filterTable() {
    // Lấy giá trị được chọn từ dropdown
    const selectedCategory = document.getElementById("categoryFilter").value;

    // Lấy tất cả các hàng dữ liệu từ bảng
    const rows = document.querySelectorAll("#datatablesSimple tbody tr");

    // Lặp qua từng hàng trong bảng
    rows.forEach(row => {
        // Lấy giá trị của thuộc tính `data-category-id` của hàng
        const categoryId = row.getAttribute("data-category-id");

        // Hiển thị hoặc ẩn hàng dựa trên giá trị được chọn
        if (selectedCategory === "" || 
            categoryId === selectedCategory || 
            (selectedCategory === "other" && !["1", "2", "3", "4", "5"].includes(categoryId))) {
            row.style.display = ""; // Hiển thị hàng
        } else {
            row.style.display = "none"; // Ẩn hàng
        }
    });
}
