# EtherHeal-TrojanX
Repository for EtherHeal, by team TrojanX for Rakathon 2021

## Ethereum based Organ Donation & Transplant Matching


### Team Members: 
[Soumyadeepta Das](https://github.com/soumyadeeptadas)
[Ananya Sajwan](https://github.com/anasajwan2407)


Organ Donation and Transplant Matching system using Ethereum blockchain technology, to provide functionalities like donor-recipient automated transplant matching for organ donation, easy access of medical records, and holistic platform for the whole system; in a highly secure, traceable and automated way, aiaming to enhance the whole system and process of organ distribution as well as transplant matching,saving lives and curb illegal activities like trafficking, etc.


## Getting Started

Steps to run:
- clone the repository
- cd to the directory with the repository
- cd to `Complete Project` folder
- run `npm install` 
- Next, navigate to `seed` folder and run
  `node hospital-seeder.js` (only for the first time you setup the app locally)
- Now, navigate to `client` folder and run `npm install`
- run the backend using `npm start` in the `Complete Project` folder.
- Now, Navigate to `client` folder and run `npm start` to start frontend

## Software Prerequisites to test the application properly:
- Ganache: Development tool for creating test development blockchain environment. It should be installed and a workspace shoud be running, with the smart conttract deployed in it on any address, from the remix IDE after compilation.

- Remix IDE: browser based IDE for creating, compiling and deploying smart contracts. Upload the 'EtherHealFinal.sol' file on the IDE, compile, and deploy on ganache workspace on specific adress.

- Metamask: Browser extension based interface for the transactions. Will automatically connect to the app upon activation.


## Functionalities

- Donor Signup: <br/>
Fill out the form and click on the submit button to register as a new donor.

<br/>

- Donor Login: <br/>
Enter the ethereum address (public key) of the donor to view the current application status.

<br/>

If donor has not been matched with any recipient:-

<br/>

If donor has been matched with any recipient:-

<br/>

- Hospital Login: <br/>
Enter the hospital name and password to move to the dashboard.

<br/>


## Hospital Dashboard

The hospital dashboard offers several functionalities each of which can be accessed by choosing the right option from the taskbar and filling out the required details.

Some of the functionalities are:

- Approve Donor: <br/>
Enter details and click on submit.

<br/>

- Register Recipient:<br/>
Enter details and click on submit.

<br/>

- Transplant Match: <br/>
Click on Match button for designated recipient to find its donor.

<br/>

- Patient Record: <br/>
Upload medical records of the patient.

<br/>
