// Booking System
class BookingSystem {
    constructor() {
        this.currentStep = 1;
        this.selectedSeats = [];
        this.addOns = [];
        this.totalAmount = 0;
        
        this.initializeElements();
        this.bindEvents();
        this.generateSeatingLayout();
        this.loadAddOns();
    }
    
    initializeElements() {
        this.steps = document.querySelectorAll('.step');
        this.bookingSteps = document.querySelectorAll('.booking-step');
        this.prevButton = document.getElementById('prevStep');
        this.nextButton = document.getElementById('nextStep');
        this.seatingLayout = document.querySelector('.seating-layout');
    }
    
    bindEvents() {
        this.prevButton.addEventListener('click', () => this.navigateStep('prev'));
        this.nextButton.addEventListener('click', () => this.navigateStep('next'));
        
        // Seat selection events
        this.seatingLayout.addEventListener('click', (e) => {
            if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')) {
                this.toggleSeat(e.target);
            }
        });
    }
    
    generateSeatingLayout() {
        const rows = 8;
        const seatsPerRow = 12;
        
        for (let i = 0; i < rows; i++) {
            const row = document.createElement('div');
            row.className = 'seat-row';
            
            for (let j = 0; j < seatsPerRow; j++) {
                const seat = document.createElement('div');
                seat.className = 'seat';
                seat.dataset.row = String.fromCharCode(65 + i);
                seat.dataset.number = j + 1;
                
                // Randomly mark some seats as occupied (for demo purposes)
                if (Math.random() < 0.3) {
                    seat.classList.add('occupied');
                }
                
                row.appendChild(seat);
            }
            
            this.seatingLayout.appendChild(row);
        }
    }
    
    toggleSeat(seatElement) {
        seatElement.classList.toggle('selected');
        
        const seatInfo = {
            row: seatElement.dataset.row,
            number: seatElement.dataset.number
        };
        
        if (seatElement.classList.contains('selected')) {
            this.selectedSeats.push(seatInfo);
        } else {
            this.selectedSeats = this.selectedSeats.filter(seat => 
                !(seat.row === seatInfo.row && seat.number === seatInfo.number)
            );
        }
        
        this.updateTotalAmount();
    }
    
    loadAddOns() {
        const addOnsContainer = document.querySelector('.add-ons-container');
        const addOnsData = [
            { id: 1, name: 'Popcorn', price: 8.99 },
            { id: 2, name: 'Soft Drink', price: 4.99 },
            { id: 3, name: 'Nachos', price: 7.99 }
        ];
        
        addOnsData.forEach(addOn => {
            const addOnElement = document.createElement('div');
            addOnElement.className = 'add-on-item';
            addOnElement.innerHTML = `
                <div class="add-on-info">
                    <h4>${addOn.name}</h4>
                    <p>$${addOn.price.toFixed(2)}</p>
                </div>
                <div class="add-on-quantity">
                    <button class="btn btn-sm btn-secondary decrease">-</button>
                    <span class="quantity">0</span>
                    <button class="btn btn-sm btn-secondary increase">+</button>
                </div>
            `;
            
            addOnsContainer.appendChild(addOnElement);
        });
    }
    
    updateTotalAmount() {
        const seatPrice = 12.99;
        const addOnsTotal = this.addOns.reduce((total, addOn) => total + (addOn.price * addOn.quantity), 0);
        
        this.totalAmount = (this.selectedSeats.length * seatPrice) + addOnsTotal;
        
        // Update summary
        const summaryDetails = document.querySelector('.summary-details');
        if (summaryDetails) {
            summaryDetails.innerHTML = `
                <p>Seats (${this.selectedSeats.length}): $${(this.selectedSeats.length * seatPrice).toFixed(2)}</p>
                <p>Add-ons: $${addOnsTotal.toFixed(2)}</p>
                <h4>Total: $${this.totalAmount.toFixed(2)}</h4>
            `;
        }
    }
    
    navigateStep(direction) {
        const maxStep = 3;
        
        if (direction === 'next' && this.currentStep < maxStep) {
            this.currentStep++;
        } else if (direction === 'prev' && this.currentStep > 1) {
            this.currentStep--;
        }
        
        this.updateStepUI();
    }
    
    updateStepUI() {
        // Update step indicators
        this.steps.forEach(step => {
            const stepNumber = parseInt(step.dataset.step);
            step.classList.toggle('active', stepNumber === this.currentStep);
            step.classList.toggle('completed', stepNumber < this.currentStep);
        });
        
        // Show/hide step content
        this.bookingSteps.forEach((step, index) => {
            step.classList.toggle('hidden', index + 1 !== this.currentStep);
        });
        
        // Update buttons
        this.prevButton.style.display = this.currentStep === 1 ? 'none' : 'block';
        this.nextButton.textContent = this.currentStep === 3 ? 'Confirm Payment' : 'Next';
    }
}

// Initialize booking system
document.addEventListener('DOMContentLo aded', () => {
    const bookingSystem = new BookingSystem();
});