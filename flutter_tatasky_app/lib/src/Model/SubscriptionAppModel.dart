class SubscriptionAppModel{
  String imagePath;
  int sid;
  String description;
  String title;
  String imagemainPath;
  SubscriptionAppModel(
    {this.imagePath='', sid,
    this.description='',
    this.imagemainPath='',
    this.title='',
    });   
}

class SubscriptionPlanModel
{
  String planName = '' ;
  bool isSelected  ;
  String planDescription ;
  String planPrice ;
  String planPriceDescrition ;
  int type;
  String planPriceOnly;
  String planNameOnly;
  int totalApp;


SubscriptionPlanModel({this.planName = '', this.isSelected = false, this.planDescription = '', this.planPrice = '', this.planPriceDescrition = '', this.type=1, this.planNameOnly ='', this.planPriceOnly  = '', this.totalApp = 0});
}

 List<SubscriptionAppModel>  subscriptionApp=[  

    SubscriptionAppModel(imagePath: 'assets/images/netflixlogocircle.png', sid:1, description:"Netflix is a streaming service that offers a wide varity of award-winning TV shows, movies, anime, documentaries and more",
    imagemainPath: 'https://media.foxbusiness.com/BrightCove/854081161001/201912/3545/854081161001_6118047080001_6118037817001-vs.jpg',
    title: 'Netflix'
    
     ),
     SubscriptionAppModel(imagePath: 'assets/images/primevideo.png',sid:2,
    description:"Primevideo is a streaming service that offers a wide varity of award-winning TV shows, movies, anime, documentaries and more",
    imagemainPath:'https://lh3.googleusercontent.com/VojafVZNddI6JvdDGWFrRmxc-prrcInL2AuBymsqGoeXjT4f9sv7KnetB-v3iLxk_Koi',
  
    title: 'Primevideo'
     
     
     ),
      SubscriptionAppModel(imagePath: 'assets/images/sunnxt.png',sid:3,
      description:"Sunnxt is a streaming service that offers a wide varity of award-winning TV shows, movies, anime, documentaries and more",
    imagemainPath: 'https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/06/91/ea/0691ea53-16cf-c891-c5ef-788cec413562/App_Icon-marketing.lsr/1024x1024bb.jpg',
   
    title: 'Sunnxt'),
       SubscriptionAppModel(imagePath: 'assets/images/geefive.jpg',sid:4,
       description:"ZEE5 is a streaming service that offers a wide varity of award-winning TV shows, movies, anime, documentaries and more",
    imagemainPath: 'https://www.adgully.com/img/800/201812/zee5.jpg',
   
    title: 'ZEE5'),
        SubscriptionAppModel(imagePath: 'assets/images/hotstar.jpg', sid:5,
        description:"Hotstar is a streaming service that offers a wide varity of award-winning TV shows, movies, anime, documentaries and more",
    imagemainPath: 'https://www.jagranimages.com/images/newimg/03042020/03_04_2020-disney-plus-hotstar-india-launch_20161418.jpg',
    title: 'Hotstar'),
        
    ];


/// installation  method class

 
class InstallationMethod{
  
  String description;
  String title;
  String helpertext;
  bool isSelected;
  InstallationMethod(
    {
    this.description='',
   this .isSelected=false,
    this.title='',
    this.helpertext = ''
    });   
}





 List<InstallationMethod>  installationMethod=[  

    InstallationMethod( description:'you device will be shipped to your address with installation guide for self-installation. Recommended for contactless installation',
   
    title: 'Do it yourself',
    helpertext: "You can either do it yourself or we can send\n our installer to your address"
    
     ),
     InstallationMethod(
    description:"Our agent with visit your address and do the installation for you. Recommended for people not comfortable with self installation",
   
    title: 'Installer Required',
     helpertext: "You can do it yourself or we can send\n our installer to your address",
     
     
     ),
     
        
    ];

