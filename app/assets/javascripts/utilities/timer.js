document.addEventListener('turbolinks:load', () => {
    const timerDiv = document.querySelector('.timer');

    if (timerDiv) {
        const countDownDateTime = new Date( parseInt(timerDiv.dataset.timer));


        const countdownTimer = setInterval(() => {
            let  now = new Date().getTime();

            let  distance = countDownDateTime - now;

            if (distance <= 0) {
                timerDiv.textContent = 'Times up!';
                alert('Your time has come!');
                document.querySelector('form').submit();
                clearInterval(countdownTimer)
            }

            let  hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            let  minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
            let  seconds = Math.floor((distance % (1000 * 60)) / 1000);

            timerDiv.textContent = `${hours}h : ${minutes}m : ${seconds}s`;

        }, 1000)
    }
}); 
