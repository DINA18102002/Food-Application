// Track Order JavaScript functionality
document.addEventListener('DOMContentLoaded', function() {
    // Chat functionality
    const chatModal = document.getElementById('chatModal');
    const messageInput = document.getElementById('messageInput');
    const chatMessages = document.getElementById('chatMessages');

    window.openChat = function() {
        chatModal.classList.add('active');
    };

    window.closeChat = function() {
        chatModal.classList.remove('active');
    };

    window.sendMessage = function() {
        const message = messageInput.value.trim();
        if (message) {
            // Add user message
            const userMessage = document.createElement('div');
            userMessage.className = 'message user';
            userMessage.innerHTML = `
                <span>${message}</span>
                <time>${new Date().toLocaleTimeString()}</time>
            `;
            chatMessages.appendChild(userMessage);

            // Clear input
            messageInput.value = '';

            // Scroll to bottom
            chatMessages.scrollTop = chatMessages.scrollHeight;

            // Simulate partner response
            setTimeout(() => {
                const responses = [
                    "I'm about 10 minutes away!",
                    "I'll be there soon!",
                    "Just making a quick turn, almost there!",
                    "Traffic is good, making good time!"
                ];
                const randomResponse = responses[Math.floor(Math.random() * responses.length)];
                
                const partnerMessage = document.createElement('div');
                partnerMessage.className = 'message partner';
                partnerMessage.innerHTML = `
                    <span>${randomResponse}</span>
                    <time>${new Date().toLocaleTimeString()}</time>
                `;
                chatMessages.appendChild(partnerMessage);
                chatMessages.scrollTop = chatMessages.scrollHeight;
            }, 1000);
        }
    };

    // Handle Enter key in chat input
    messageInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });

    // Close modal when clicking outside
    chatModal.addEventListener('click', function(e) {
        if (e.target === chatModal) {
            closeChat();
        }
    });

    // Simulate order status updates
    let currentStatus = 0;
    const statuses = ['preparing', 'ready', 'delivering', 'delivered'];
    const progressFill = document.querySelector('.progress-fill');
    
    const updateStatus = () => {
        if (currentStatus < statuses.length) {
            progressFill.setAttribute('data-status', statuses[currentStatus]);
            currentStatus++;
        }
    };

    // Update status every 10 seconds
    setInterval(updateStatus, 10000);
});