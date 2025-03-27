 // Function to select position
        function selectPosition(element, position) {
            // Remove selected class from all position cards
            document.querySelectorAll('.position-card').forEach(card => {
                card.classList.remove('selected');
            });
            
            // Add selected class to clicked card
            element.classList.add('selected');
            
            // Set the hidden input value
            document.getElementById('selectedPosition').value = position;
            
            // Update progress bar
            updateProgress();
        }
        
        // Function to update progress bar
        function updateProgress() {
            const form = document.getElementById('jobApplicationForm');
            const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
            let filledCount = 0;
            
            inputs.forEach(input => {
                if (input.value.trim() !== '') {
                    filledCount++;
                }
            });
            
            const progress = Math.floor((filledCount / inputs.length) * 100);
            document.getElementById('formProgress').style.width = progress + '%';
        }
        
        // Add event listeners to track form progress
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('jobApplicationForm');
            const inputs = form.querySelectorAll('input, select, textarea');
            
            inputs.forEach(input => {
                input.addEventListener('change', updateProgress);
                input.addEventListener('keyup', updateProgress);
            });
            
            // Initialize progress
            updateProgress();
        });