import React from "react";
import {MDBMask, MDBRow, MDBBtn, MDBView, MDBContainer} from "mdbreact";
import './css/HomePage.css';



const HomePage = () => {
  return (
  <MDBView className="views">
   
    <MDBMask className="d-block justify-content-center align-items-center gradient">
      <MDBContainer>
        <MDBRow>
          <div className="white-text text-center text-md-center col-md-12 mt-xl-5 mb-5">
          <h3 className="display-3  mb-0 pt-md-5" style={{color: "#000000",fontFamily: "cursive"}}>
              <br/>
              EtherealHeal{" "}
            </h3>
            <hr className="hr-dark" />
            <h4 className="mb-4">
            <div style={{color: "#000000", fontWeight: "70"}}>Ethereum based Organ Donation and Transplant matching.<br/>
             By team TrojanX</div> 
            </h4>
            <MDBBtn outline color="black" href="/signup">
              
              New Donor? Sign up!
             
            </MDBBtn>
          </div>
        </MDBRow>
      </MDBContainer>
    </MDBMask>
  </MDBView>
    );
}
  
  export default HomePage;