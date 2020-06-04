let answer = document.getElementById('answer');
let note = document.getElementById('note');

document.querySelectorAll('.button').forEach(button => {

    let getVar = variable => getComputedStyle(button).getPropertyValue(variable);

    button.addEventListener('click', e => {
    	note.innerText="정답 전송중!";
        if(!button.classList.contains('active')) {

            button.classList.add('active');

            gsap.to(button, {
                keyframes: [{
                    '--left-wing-first-x': 50,
                    '--left-wing-first-y': 100,
                    '--right-wing-second-x': 50,
                    '--right-wing-second-y': 100,
                    duration: .2,
                    onComplete() {
                        gsap.set(button, {
                            '--left-wing-first-y': 0,
                            '--left-wing-second-x': 40,
                            '--left-wing-second-y': 100,
                            '--left-wing-third-x': 0,
                            '--left-wing-third-y': 100,
                            '--left-body-third-x': 40,
                            '--right-wing-first-x': 50,
                            '--right-wing-first-y': 0,
                            '--right-wing-second-x': 60,
                            '--right-wing-second-y': 100,
                            '--right-wing-third-x': 100,
                            '--right-wing-third-y': 100,
                            '--right-body-third-x': 60
                        })
                    }
                }, {
                    '--left-wing-third-x': 20,
                    '--left-wing-third-y': 90,
                    '--left-wing-second-y': 90,
                    '--left-body-third-y': 90,
                    '--right-wing-third-x': 80,
                    '--right-wing-third-y': 90,
                    '--right-body-third-y': 90,
                    '--right-wing-second-y': 90,
                    duration: .2
                }, {
                    '--rotate': 50,
                    '--left-wing-third-y': 95,
                    '--left-wing-third-x': 27,
                    '--right-body-third-x': 45,
                    '--right-wing-second-x': 45,
                    '--right-wing-third-x': 60,
                    '--right-wing-third-y': 83,
                    duration: .25
                }, {
                    '--rotate': 60,
                    '--plane-x': -8,
                    '--plane-y': 40,
                    duration: .2
                }, {
                    '--rotate': 40,
                    '--plane-x': 45,
                    '--plane-y': -300,
                    '--plane-opacity': 0,
                    duration: .375,
                    onComplete() {
                        setTimeout(() => {
                            button.removeAttribute('style');
                            
                            gsap.fromTo(button, {
                                opacity: 0,
                                y: -8
                            }, {
                                opacity: 1,
                                y: 0,
                                clearProps: true,
                                duration: .3,
                                onComplete() {
                                    button.classList.remove('active');
                                    $.ajax({
                                        url: "sendanswer",
                                        type: "POST",
                                        data: {
                                        	
                                        	answer : answer.value
                                        },
                                        success: function(data){
                                        	button.style.display='none';
                                        	answer.style.display='none';
                                        	note.innerText="전송 성공! 다른 플레이어가 정답을 제출할 때 까지 잠시 기다려주세요!";
                                        	
                                        },
                                        error: function(){
                                        	note.innerText="오류가 생겼습니다. 다시 시도 해주세요.";
                                            
                                        }
                                    });
                                }
                            })
                        }, 1800)
                    }
                }]
            	
            })

            gsap.to(button, {
                keyframes: [{
                    '--text-opacity': 0,
                    '--border-radius': 0,
                    '--left-wing-background': getVar('--primary-dark'),
                    '--right-wing-background': getVar('--primary-dark'),
                    duration: .11
                }, {
                    '--left-wing-background': getVar('--primary'),
                    '--right-wing-background': getVar('--primary'),
                    duration: .14
                }, {
                    '--left-body-background': getVar('--primary-dark'),
                    '--right-body-background': getVar('--primary-darkest'),
                    duration: .25,
                    delay: .1
                }, {
                    '--trails-stroke': 171,
                    duration: .22,
                    delay: .22
                }, {
                    '--success-opacity': 1,
                    '--success-x': 0,
                    duration: .2,
                    delay: .15
                }, {
                    '--success-stroke': 0,
                    duration: .15
                }]
            })

        }

    })

});
