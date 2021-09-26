# SEVi
Repository for the project "Sala de espera virtual" 

## Disclaimer

This project was made with academical purposes and should be taken as that. It's and MVP and should not be used in production.

## Introduction
This project was born to help people in Mexico with hospital emergencies in times of pandemic (2019 - x) it aims to keep the relatives of a hospitalized patient informed, without having to stop them in their daily activities.

So when there is information available this app will receive the notifications and will allow to consult the information available at that time.

##

Features:
  - Authentication.
  - Receive push notifications.
  - Consult Informs from the patients assigned to you.
  - Authorize procedures related to those informs.


## Technologies
 - SwiftUI
 - Combine
 - Keychain for JWT
 
 
 No extra libraries used for this project, probably will to integrate some for this
 
 ## TODO
  - Implement real logout (right now only ereases the token).
  - On log out notify device is no longer available to notifications.
  - Create Test Cases.
  - Integrate Sign up in the app.
  - Allow sharing a stay with a QR code.
  - Decrease Data usage using observable objects.
  - Move data to an Environment Object.
  - Include more Images on the inform view.
  - Add loading screens for feedback
  - Add Animations fot a better looking app.
  - Define behavior for different types of push notifications.
  - Rewrite Network layer for decouple the decoding of the information outside of the request.
  - Integrate a logging Library.
  
  
 
