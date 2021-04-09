pragma solidity >=0.4.22 <0.6.0;

contract OrganChain {
    
    //structures
    struct recipient{
        address patientid;
        address hospitalid;
        string ipfshash;
        string EMRhash;
        uint priority;
        string organ;
        string bloodgroup;
        bytes32 rhfactor;
        bool matchfound;
        bool exist;
    }
    
    struct donor{
        address donorid;
        string ipfshash;
        string EMRhash;
        string organ;
        string bloodgroup;
        bytes32 rhfactor;
        bool matchfound;
        bool exist;
    }
    
    struct transplant{
        address recipient;
        address donora;
        bool exist;
    }
    
    //global variables
    address[] recipientarr;
    address[] donorarr;
    address[] transplantarr;
    
    //Mappings
    mapping(address => recipient) Recipients;
    mapping(address => donor) Donors;
    mapping(address => transplant) Transplants;
    mapping(address => address[]) hospital_recipient;
    
    //modifier
    
    modifier checkrecipientexist(address addr){
        require(!Recipients[addr].exist,"recipient already added");
        _;
    }
    
     modifier checkdonorexist(address addr){
        require(!Donors[addr].exist,"recipient already added");
        _;
    }
    
    //donor functions
    
    function adddonor(
        address donori,
        string memory hash,
        string memory hash2,
        string memory organ_name,
        string memory bgroup
        ) public checkdonorexist(donori){
            Donors[donori]=donor(donori,hash,hash2,organ_name,bgroup,"positive",false,true);
            donorarr.push(donori);
        }
        
    function getdonor(address donoradd) public view
    returns (address,
    string memory,
    string memory,
    string memory,
    address){
        if(!Donors[donoradd].matchfound)
        return(
            Donors[donoradd].donorid,
            Donors[donoradd].ipfshash,
            Donors[donoradd].organ,
            Donors[donoradd].bloodgroup,
            0x0000000000000000000000000000000000000000
            );
        else
            for(uint i=0;i<transplantarr.length;i++)
        {
            if(donoradd==Transplants[transplantarr[i]].donora)
            return(Donors[donoradd].donorid,
            Donors[donoradd].ipfshash,
            Donors[donoradd].organ,
            Donors[donoradd].bloodgroup,
            Transplants[transplantarr[i]].recipient);
        }
    }
    
    function getdonorwithtransplant(address donoradd) public view
    returns (address,
    string memory,
    string memory,
    string memory,
    address) {
        for(uint i=0;i<transplantarr.length;i++)
        {
            if(donoradd==Transplants[transplantarr[i]].donora)
            return(Donors[donoradd].donorid,
            Donors[donoradd].ipfshash,
            Donors[donoradd].organ,
            Donors[donoradd].bloodgroup,
            Transplants[transplantarr[i]].recipient);
        }
    }
    
    //recipient functions
    
    function addrecipient(
        address hospi,
        address patient,
        string memory hash,
        string memory hash2,
        string memory organ_name,
        string memory bgroup) public checkrecipientexist(patient){
            Recipients[patient]=recipient(patient,hospi,hash,hash2,0,organ_name,bgroup,"positive",false,true);
            recipientarr.push(patient);
            hospital_recipient[hospi].push(patient);
    }
        
    function getrecipient(address reciadd) public view
    returns(address,
    address,
    string memory,
    string memory,
    string memory){
        return(
            Recipients[reciadd].patientid,
            Recipients[reciadd].hospitalid,
            Recipients[reciadd].ipfshash,
            Recipients[reciadd].organ,
            Recipients[reciadd].bloodgroup);
    }
    
    function getrecipientcount(address hospiadd) public view returns(uint256)
    {
        return(hospital_recipient[hospiadd].length);
    }
    
    function getrecipientdetail(address hospiaddr, uint256 m) public view 
    returns(address,
        string memory,
        string memory,
        string memory
        ){  
                if(!Recipients[hospital_recipient[hospiaddr][m]].matchfound)
                {   
                   return(
                       Recipients[hospital_recipient[hospiaddr][m]].patientid,
                       Recipients[hospital_recipient[hospiaddr][m]].ipfshash,
                       Recipients[hospital_recipient[hospiaddr][m]].organ,
                       Recipients[hospital_recipient[hospiaddr][m]].bloodgroup);
                }
    }
    
    //transplant matching
    
    function transplantmatch(address recipientad) public
    returns(address) {
        for(uint i=0;i<donorarr.length;i++)
        {
            if( (keccak256(abi.encodePacked(Recipients[recipientad].organ))==keccak256(abi.encodePacked(Donors[donorarr[i]].organ))) 
            && (      keccak256(abi.encodePacked(Recipients[recipientad].bloodgroup))==keccak256(abi.encodePacked(Donors[donorarr[i]].bloodgroup))) )
            {   Transplants[recipientad]=transplant(recipientad,donorarr[i],true);
                transplantarr.push(recipientad);
                Recipients[recipientad].matchfound=true;
                Donors[donorarr[i]].matchfound=true;
                return (donorarr[i]);
            }
        }
    }
    
    
    
    function transplantedrecipient(address recipientadr) public view
    returns(address) {
        return Transplants[recipientadr].donora;
        
    }
    
    //patient record
    
    function EMR(address patientaddr) public view
    returns (string memory) {
        for(uint i=0;i<donorarr.length;i++)
        {
            if(patientaddr==donorarr[i])
            return(Donors[donorarr[i]].EMRhash);
        }
        for(uint j=0;j<recipientarr.length;j++)
        {
            if(patientaddr==recipientarr[j])
            return(Recipients[recipientarr[j]].EMRhash);
        }
    }
     
}
