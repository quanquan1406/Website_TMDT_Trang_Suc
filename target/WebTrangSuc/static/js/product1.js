document.addEventListener("DOMContentLoaded", function () {
    function filterProducts() {
        // Lấy tất cả các checkbox từ form filter-box
        const filters = document.querySelectorAll(".filter-form input[type='checkbox']");
        const products = document.querySelectorAll(".product-card");

        const activeFilters = {
            category: [],
            price: []
        };

        // Duyệt qua các checkbox đã chọn
        filters.forEach(filter => {
            if (filter.checked) {
                if (filter.name === "price") {
                    activeFilters.price.push(filter.value);
                } else {
                    activeFilters.category.push(filter.value);
                }
            }
        });

        // Ẩn hoặc hiện sản phẩm dựa trên bộ lọc
        products.forEach(product => {
            const productCategory = product.getAttribute("data-category");
            const productPrice = parseInt(product.getAttribute("data-price"), 10);

            // Kiểm tra bộ lọc loại sản phẩm
            const categoryMatch = activeFilters.category.length
                ? activeFilters.category.includes(productCategory)
                : true;

            // Kiểm tra bộ lọc giá
            const priceMatch = activeFilters.price.length
                ? activeFilters.price.some(range => {
                    const [min, max] = range.split("-").map(val => parseInt(val || Infinity, 10));
                    return productPrice >= min && productPrice <= max;
                })
                : true;

            // Hiển thị hoặc ẩn sản phẩm dựa trên bộ lọc
            if (categoryMatch && priceMatch) {
                product.style.display = "block";
            } else {
                product.style.display = "none";
            }
        });
    }

    // Gắn sự kiện onchange cho các checkbox trong filter-box
    const checkboxes = document.querySelectorAll(".filter-form input[type='checkbox']");
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener("change", filterProducts);
    });
});
