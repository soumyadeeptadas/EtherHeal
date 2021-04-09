var Hospi= require('../models/hospitals');
var mongoose= require('mongoose');
mongoose.connect('mongodb+srv://sduser:sduser@sdcluster.jluhu.mongodb.net/rakathondb?retryWrites=true&w=majority',{ useNewUrlParser: true,  useUnifiedTopology: true  }, function(err,db){
    if (!err){
        console.log('Connected to /EtherHeal!');
    } else{
        console.dir(err); //failed to connect
    }
});

var hospitals= [new Hospi({
	username: 'Ace Hospital',
	password: 'pass',
	hospitalpublickey: '0x918e267B1163a59aA9dd56033F631769d3033319',
	address: 'Survey No. 32/2A, Pune, Maharashtra',
	contact: '020-25434063',
	city: 'Pune',
	imgurl: './images/ace.jpg'
}),
new Hospi({
	username: 'AIIMS Delhi',
	password: 'pass',
	hospitalpublickey: '0x011500c3231C3D15D1c0ccf5D2D804E9e933a757',
	address: 'Aurobindo Marg, New Delhi',
	contact: '011-26588500',
	city: 'New Delhi',
	imgurl: './images/aiims.jpg'
}),
new Hospi({
	username: 'Fortis Hospital',
	password: 'pass',
	hospitalpublickey: '0xE1377667811fc58504Af761200D788Dd8D3b7c4c',
	address: 'Sector B-1, vasant kunj, New Delhi',
	contact: '011-42776222',
	city: 'New Delhi',
	imgurl: './images/fortis.jpg'
}),
new Hospi({
	username: 'GB Pant Hospital',
	password: 'pass',
	hospitalpublickey: '0x9B0757A774fa2e999E9042A042F90bBf3BB02dF8',
	address: '1, Jawahar Lal Nehru Marg, New Delhi',
	contact: '011-23234242',
	city: 'New Delhi',
	imgurl: './images/gbpant.jpg'
}),
new Hospi({
	username: 'Birla Hospital',
	password: 'pass',
	hospitalpublickey: '0x8444E4aaD447BAA2Dd10A5d681f617c801c78bCA',
	address: 'Surya Mandir Road, Near Sun Temple, Opposite Mahaveer Residency, Gwalior, Madhya Pradesh',
	contact: '0751-2405659',
	city: 'Gwalior',
	imgurl: './images/birla.jpg'
}),
new Hospi({
	username: 'Apollo Hospital',
	password: 'pass',
	hospitalpublickey: '0x496768E92E30ab9CC0748A140628f1Cb44B7dC54',
	address: '18, Kila Gate Road, Vikas Nagar, Near Sai Baba Mandir, Gwalior, Madhya Pradesh',
	contact: '0751-2454600',
	city: 'Gwalior',
	imgurl: './images/apollo.jpg'
}),
new Hospi({
	username: 'Sahara Hospital',
	password: 'pass',
	hospitalpublickey: '0x1D3B5BC4B25D4582fd5065a47513373f46146CCE',
	address: '19 A, Vijay Nagar Extension, Basant Vihar Colony, Lashkar, Gwalior, Madhya Pradesh',
	contact: '09926800870',
	city: 'Gwalior',
	imgurl: './images/sahara.jpg'
}),
new Hospi({
	username: 'Columbia Asia Hospital',
	password: 'pass',
	hospitalpublickey: '0x9b2A0377CFE97CBB44b1B6ceFaf94a6C0E9d4CDD',
	address: '22, 2A, Mundhwa - Kharadi Rd, Near Nyati Empire, Santipur, Thite Nagar, Kharadi, Pune, Maharashtra',
	contact: '020-71290222',
	city: 'Pune',
	imgurl: './images/columbia.jpg'
})];
var done=0;
for(var i=0;i<hospitals.length;i++)
{
	hospitals[i].save(function(err,result){
		console.log(result);
		done++;
		if(done=== hospitals.length)
			exit();
	});
}
function exit(){
	mongoose.disconnect();
}
