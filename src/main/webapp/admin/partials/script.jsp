<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
  // Confirm delete and redirect if confirmed
  function confirmDelete(url) {
    if (confirm("Are you sure you want to delete this record?")) {
      window.location.href = url;
    }
    return false;
  }

  // Live table row filter
  document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search");
    const tableRows = document.querySelectorAll("#table tr");

    if (searchInput) {
      searchInput.addEventListener("input", function () {
        const query = this.value.trim().toLowerCase();

        tableRows.forEach(row => {
          const rowText = row.innerText.toLowerCase();
          row.style.display = rowText.includes(query) ? "" : "none";
        });
      });
    }
  });
</script>