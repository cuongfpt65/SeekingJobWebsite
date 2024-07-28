<%-- 
    Document   : Contact
    Created on : Jul 25, 2024, 10:10:42 PM
    Author     : Trần Tấn Lợi-CE171879
--%>
<%@include file="./Header/HeaderCompany.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <style>
            .you-will-growv {
                width: 631px;
                position: relative;
                display: -webkit-inline-box;
                overflow: hidden;
                text-overflow: ellipsis;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                font-size: xx-large;
            }
            .text1v {
                width: 564px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
            }
            .pellentesque-arcu-facilisisv {
                    width: 523px;
                position: relative;
                font-size: 16px;
                line-height: 24px;
                display: -webkit-inline-box;
                overflow: hidden;
                text-overflow: ellipsis;
                
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                font-size: large;
            }
            .texttcv {
                width: 620px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 40px;
                margin-bottom: 40px;
            }
            .phone-iconv {
                width: 28px;
                position: relative;
                height: 28px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .call-for-inquiryv {
                position: relative;
                line-height: 24px;
            }
            .divv {
                 word-wrap: break-word;
                position: relative;
                font-size: 20px;
                line-height: 24px;
            }
            .icon-textv {
                width: 212px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-end;
                gap: 16px;
            }
            .icon-text1v {
                 margin-left: -48px;
                    width: 208px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 16px;
            }
            .icons-textv {
                width: 654px;
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 60px 104px;
                font-size: 24px;
            }
            .text-iconssv {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 60px;
            }
            .contact-infov {
                position: relative;
            }
            .nibh-dis-faucibusv {
                width: 323px;
                position: relative;
                font-size: 16px;
                line-height: 24px;
                text-align: center;
                display: inline-block;
                height: 23px;
                flex-shrink: 0;
            }
            .text2av {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 20px;
            }
            .labelv {
                position: relative;
                line-height: 20px;
            }
            .placeholderv {
                flex: 1;
                position: relative;
                line-height: 20px;
            }
            .contentv {
                align-self: stretch;
                border-radius: 6px;
                background-color: #fff;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                padding: 9px 16px;
                color: #6c757d;
            }
            .inputtv {
                width: 240px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 6px;
            }
            .inputsv {
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
            }
            .input2v {
                width: 504px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 6px;
            }
            .content3v {
                align-self: stretch;
                flex: 1;
                border-radius: 6px;
                background-color: #fff;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 9px 16px;
                color: #6c757d;
            }
            .input3v {
                width: 504px;
                height: 178px;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 6px;
            }
            .registerav {
                position: relative;
                text-transform: capitalize;
            }
            .buttonv {
                width: 248px;
                border-radius: 8px;
                background-color: #309689;
                height: 40px;
                overflow: hidden;
                flex-shrink: 0;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: center;
                padding: 14px 20px;
                box-sizing: border-box;
                color: #fff;
            }
            .input-buttonv {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 40px;
            }
            .inputs-buttonv {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                gap: 24px;
                font-size: 16px;
            }
            .formv {
                border-radius: 20px;
                background-color: #ebf5f4;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                padding: 60px 40px;
                gap: 40px;
                font-size: 28px;
            }
            .text-icons-formv {
                width: 1365px;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: space-between;
                padding: 60px 72px;
                box-sizing: border-box;
            }
           
            .mapv {
                   right: 19%;
    max-width: 145%;
                border-radius: 20px;
                height: 419px;
                overflow: hidden;
                flex-shrink: 0;
                display: flex;
                flex-direction: row;
                align-items: center;
                justify-content: flex-start;
                padding: 10px 0px;
                box-sizing: border-box;
                position: relative;
                background-image: url('img/map.png');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: top;
            }
            .map-iconv {
                left: -119px;
    width: 631px;
                
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                padding: 60px 72px;
                box-sizing: border-box;
            }
            .at-eu-lobortisv {
                margin: 0;
            }
            .at-eu-lobortis-containerv {
                width: 646px;
                position: relative;
                font-size: 16px;
                display: inline-block;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
                height: 36px;
                flex-shrink: 0;
            }
            .text3v {
                display: none;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                gap: 40px;
            }
            .logos-iconv {
                width: 222.9px;
                position: relative;
                height: 60px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .logos-icon1v {
                width: 185px;
                position: relative;
                height: 60px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .logos-icon2v {
                width: 151.3px;
                position: relative;
                height: 60px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .logos-icon3v {
                width: 168.8px;
                position: relative;
                height: 60px;
                overflow: hidden;
                flex-shrink: 0;
            }
            .logos2v {
                width: 1176px;
                display: none;
                flex-direction: row;
                align-items: flex-start;
                justify-content: space-between;
            }
            .logos-icon4v {
                width: 150px;
                position: relative;
                height: 150px;
                overflow: hidden;
                
            }          
            .logos3v {
                align-self: stretch;
                height: 60px;
                display: flex;
                flex-direction: row;
                align-items: flex-start;
                justify-content: space-between;
            }
            .logos1v {
                align-self: stretch;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
                padding: 0px 60px;
                gap: 40px;
            }
            .logosv {
                width: 1440px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                padding: 60px 72px;
                box-sizing: border-box;
                gap: 60px;
                text-align: center;
            }
            .contact-usv {
                width: 100%;
                position: relative;
                background-color: #fff;
                height: 700px;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                text-align: left;
                font-size: 50px;
                color: #000;
                font-family: 'Abhaya Libre ExtraBold';
            }


        </style>
    </head>
    <body>
        <div>
            <div class="contact-usv">
                <div class="text-icons-formv">
                    <div class="text-iconsssv">
                        <div class="texttcv">
                            <div class="text1v">
                                <div class="you-will-growv">You Will Grow, You Will Succeed. We Promise That</div>
                            </div>
                            <div class="pellentesque-arcu-facilisisv">The system is always open 24/7. If you have any difficulties, please call the hotline number below or you can contact us via email.</div>
                        </div>
                        <div class="icons-textv">
                            <div class="icon-textv">
                                <img class="phone-iconv" alt="" src="img/phone.png">
                                <div class="call-for-inquiryv">Call for inquiry</div>
                                <div class="divv">v257 388-6895</div>
                            </div>
                            <div class="icon-text1v">
                                <img class="phone-iconv" alt="" src="img/mail (2).svg">
                                <div class="call-for-inquiryv">Send us email</div>
                                <a href="mailto:Cuongncce171013@fpt.edu.vn"class="divv">Cuongncce171013@fpt.edu.vn</a>                            </div>
                            <div class="icon-text1v">
                                <img class="phone-iconv" alt="" src="img/clock.svg">
                                <div class="call-for-inquiryv">Opening hours</div>
                                <div class="divv">24/7</div>
                            </div>
                            <div class="icon-text1v">
                                <img class="phone-iconv" alt="" src="img/map-pin.svg">
                                <div class="call-for-inquiryv">Office</div>
                                <div class="divv">Can Tho, Ninh Kieu, Nguyen Van Cu street, FPTU</div>
                            </div>
                        </div>
                    </div>
                    
                <div class="map-iconv">
                    <div class="mapv">
                        <img class="map-pin-icon1v" alt="" src="img/map.png">
                    </div>
                </div>
          
            </div>
        </div>

    </body>
</html>
<%@include file="./Header/Footer.jsp" %>