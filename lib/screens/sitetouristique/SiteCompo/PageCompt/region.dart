import 'package:flutter/material.dart';
import 'package:tro/screens/sitetouristique/SiteCompo/detail.dart';

class regionPage extends StatefulWidget {
  @override
  _regionPageState createState() => _regionPageState();
}

class _regionPageState extends State<regionPage> {
    void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be larger
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8, // Set height to 80% of screen height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48), // To balance the row since the IconButton takes some space
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text('Alphabetical'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Rating'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date'),
                onTap: () {
                  // Add your sorting logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

 
  void _showRegionOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to be larger
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.8, // Set height to 80% of screen height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Region',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 48), // To balance the row since the IconButton takes some space
                ],
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 1'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 2'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 3'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
                            ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Region 4'),
                onTap: () {
                  // Add your region selection logic here
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

 


  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Mountainous areas ",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(255, 171, 220, 253),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 1.6,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                       bottom: 0,
              right: MediaQuery.of(context).size.width * 0.12 - 45,
              left: MediaQuery.of(context).size.width * 0.14 - 45,
              top: MediaQuery.of(context).size.height * 0.15 - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Algeria\'s mountains,\n like the Atlas and Saharan Atlas,\n are scenic and biodiverse,\n drawing nature lovers and adventurers.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 65, 65, 65),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    //SizedBox(height: 5.0), // Space between texts
                    Text(
                      'Constantine',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.0),
              ClipRRect(
            borderRadius: BorderRadius.circular(10),
            
            
             child: Padding(
              
                padding: const EdgeInsets.only(top: 20.0, left: 90, right: 90),
                child: ImageSlider(), 
              ),
            ),
          SizedBox(height: 30),
                     GestureDetector(
                      onTap: () => _showRegionOptions(context),
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 33, 149, 243),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(196, 156, 155, 155),
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Region',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_downward,
                              color: Color.fromRGBO(62, 129, 229, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                SizedBox(height: 30),          
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          '296 activities found ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.find_replace_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 15,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => _showSortOptions(context),
                          child: Row(
                            children: [
                              Text(
                                'Sort by',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 56, 129, 177),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.swap_vert,
                                color: Color.fromARGB(255, 56, 129, 177),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 20),
GestureDetector(
  onTap: () {
    // Navigate to another page here
     Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage1()));
  },
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
    decoration: BoxDecoration(
      color: Color.fromARGB(174, 128, 167, 221),
      borderRadius: BorderRadius.circular(10),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/caption.jpg',
              width: 140,
              height: 140,
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'ACTIVITY/PLACE NAME',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 44, 44),
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  'Constantine : Discover \n old and European towns',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  '7 - 20 days',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 44, 44),
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'FROM 20 DA per person',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 62, 62),
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
),
 
 
 ],
                ),
              ),
            

  ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentPage = 0;

  final List<String> _images = [
    'assets/caption.jpg',
    'assets/caption.jpg',
    'assets/caption.jpg',
    'assets/caption.jpg',
    'assets/caption.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Transform.scale(
                scale: _currentPage == index ? 1.1 : 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // Adjust border radius as needed
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: _currentPage == index ? 20 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? const Color.fromARGB(255, 27, 87, 137) : Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
