/*
import { getAuth, RecaptchaVerifier, signInWithPhoneNumber  } from "https://www.gstatic.com/firebasejs/9.3.0/firebase-auth.js";
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.3.0/firebase-app.js";
const firebaseConfig = {
    apiKey: "AIzaSyAqmCdYn5b7UCtBrU9IX2eNmr-2D3Izc7k",
    authDomain: "retailstorage-5432c.firebaseapp.com",
    projectId: "retailstorage-5432c",
    storageBucket: "retailstorage-5432c.appspot.com",
    messagingSenderId: "232349606507",
    appId: "1:232349606507:web:d58ded510636de342b472e",
    measurementId: "G-2YGTRXPYEH"
};
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
auth.languageCode = 'vi';

function initReCapcha(){
    window.recaptchaVerifier = new RecaptchaVerifier('sign-in-button', {
        'size': 'invisible',
        'callback': (response) => {
            sendOTP();
        },
        'expired-callback': () => {
        alert("ReCaptcha đã hết hạn, vui lòng thử lại.");
    }
    }, auth);
}

function sendOTP(){
    console.log(window.recaptchaVerifier);
    const phoneNumber = document.getElementById("phoneNumber").value;
    const appVerifier = window.recaptchaVerifier;
    const auth = getAuth();
    signInWithPhoneNumber(auth, phoneNumber, appVerifier)
        .then((confirmationResult) => {
        // SMS sent.
        // user in with confirmationResult.confirm(code).
        window.confirmationResult = confirmationResult;
        alert("OTP đã được gửi đến số điện thoại của bạn.");
    }).catch((error) => {
        alert("Có lỗi xảy ra khi gửi OTP: " + error.message);
    });
}
window.sendOTP = sendOTP;
window.onload=initReCapcha;*/
