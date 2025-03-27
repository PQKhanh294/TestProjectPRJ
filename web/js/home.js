document.addEventListener("DOMContentLoaded", function () {
    const gallery = document.querySelector(".gallery");

    if (gallery) {
        gallery.addEventListener("click", function (event) {
            const selected = event.target.closest(".section");
            if (!selected) return;

            document.querySelectorAll(".section").forEach(section => {
                section.classList.remove("active");
            });

            selected.classList.add("active");
        });
    }
});
function expandSection(section) {
    // Xóa class active của tất cả section khác
    document.querySelectorAll(".section").forEach(sec => {
        sec.classList.remove("active");
    });

    // Thêm class active vào phần được click
    section.classList.add("active");
}
document.addEventListener("DOMContentLoaded", function () {
    const popup = document.getElementById("success-popup");
    const closeBtn = document.getElementById("close-popup");
    const closeX = document.querySelector(".close-btn");

    // Kiểm tra nếu có successMessage => Hiển thị popup
    if (document.querySelector(".text-success")) {
        popup.style.display = "block";
    }

    // Đóng popup khi nhấn "OK" hoặc dấu "X"
    closeBtn.addEventListener("click", () => popup.style.display = "none");
    closeX.addEventListener("click", () => popup.style.display = "none");
});
