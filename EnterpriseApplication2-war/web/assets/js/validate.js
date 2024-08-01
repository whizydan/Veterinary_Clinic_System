/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Get the email input field
        var emailInput = document.getElementById('email_login');
        var errorSpanEmail = document.getElementById('email_error');
        var passwordInput = document.getElementById('password_login');
        var errorSpanPassword = document.getElementById('password_error');
        var submitButton = document.getElementById('submit');
        
        // Function to validate email
        function validateEmail(email) {
            // Regular expression for email validation
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
        
        function printData(){
            window.print();
        }

        // Function to handle input event
        function handleEmailInput() {
            var email = emailInput.value;
            if (validateEmail(email)) {
                // If email is valid, clear error message
                errorSpanEmail.textContent = '';
            } else {
                // If email is invalid, display error message
                errorSpanEmail.textContent = 'Please enter a valid email';
            }
        }
        
        // Function to validate password
        function validatePassword(password) {
            // Check if password has more than 6 characters
            if (password.length < 6) {
                return false;
            }

            // Check if password contains both uppercase and lowercase letters
            var hasUpperCase = /[A-Z]/.test(password);
            var hasLowerCase = /[a-z]/.test(password);

            return hasUpperCase && hasLowerCase;
        }

        // Function to handle input event
        function handlePasswordInput() {
            var password = passwordInput.value;
            if (validatePassword(password)) {
                // If password is valid, clear error message
                submitButton.disabled = false;
                errorSpanPassword.textContent = '';
            } else {
                // If password is invalid, display error message
                submitButton.disabled = true;
                errorSpanPassword.textContent = 'Password must have more than 6 characters and include both uppercase and lowercase letters';
            }
        }

        
        // Add event listener for input event
        emailInput.addEventListener('input', handleEmailInput);
        passwordInput.addEventListener('input', handlePasswordInput);