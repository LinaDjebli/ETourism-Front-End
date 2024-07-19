import 'package:flutter/material.dart';

class ExpandableItem extends StatefulWidget {
  final String username;
  final String profileImagePath;
  final String description;
  final String firstName;
  final String lastName;
  final String date;
  final String phoneNumber;
  final String email;
  final Function(String) onAccept;
  final Function(String) onRefuse;

  const ExpandableItem({
    Key? key,
    required this.username,
    required this.profileImagePath,
    required this.description,
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.phoneNumber,
    required this.email,
    required this.onAccept,
    required this.onRefuse,
  }) : super(key: key);

  @override
  _ExpandableItemState createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(174, 128, 167, 221),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.profileImagePath),
                  radius: 30,
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    widget.username,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(width: 5), 
                Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                widget.description,
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 44, 44),
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            if (_isExpanded) ...[
              SizedBox(height: 10),
              Text(
                'More Information:',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'First Name: ${widget.firstName}\n'
                'Last Name: ${widget.lastName}\n'
                'Date: ${widget.date}\n'
                'Phone Number: ${widget.phoneNumber}\n'
                'Email: ${widget.email}',
                style: TextStyle(
                  color: Color.fromARGB(255, 44, 44, 44),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      widget.onAccept(widget.username);
                    },
                    child: Text('Accept'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      widget.onRefuse(widget.username);
                    },
                    child: Text('Refuse'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class userPage extends StatefulWidget {
  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
 
  bool _isExpanded = false;
  final List<String> _acceptedItems = [];
  final List<String> _unseenItems = [];

  final List<Map<String, String>> _items = [
    {
      'username': 'lyna03',
      'profileImagePath': 'assets/caption.jpg',
      'description': 'Constantine: Discover old \nand European towns',
      'firstName': 'Lyna',
      'lastName': 'Doe',
      'date': 'January 1, 2022',
      'phoneNumber': '+1234567890',
      'email': 'lyna@example.com',
    },
    {
      'username': 'anotherUser',
      'profileImagePath': 'assets/caption.jpg',
      'description': 'Another description',
      'firstName': 'John',
      'lastName': 'Doe',
      'date': 'February 1, 2022',
      'phoneNumber': '+1987654321',
      'email': 'john@example.com',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
 ],
  ),
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(109),
    child: Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Row(
            children: [      Text(
        'Vertical Bar',
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
 ],
          ),
          SizedBox(height: 10),
                    Row(
            children: [  
      Text(
        'Statistics of the month',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),],
          ),
          SizedBox(height: 10),
          
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 55,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.search, color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Choose a destination',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(102, 0, 0, 0),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              SizedBox(
                height: 51,
                width: 51,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white),
                    ),
                    backgroundColor: Color.fromRGBO(245, 246, 249, 1),
                  ),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                    _showRegionOptions(context); // Call the function here
                  },
                  child: Icon(
                    Icons.sort,
                    color: const Color.fromARGB(128, 0, 0, 0),
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
body: Padding(
  padding: EdgeInsets.only(top: 20), // Add space between app bar and tab navigator
  child: DefaultTabController(
    length: 3,
    child: Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Accepted'),
            Tab(text: 'Unseen'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              ItemsPage(
                title: 'All Items',
                items: _items,
                onAccept: _handleAccept,
                onRefuse: _handleRefuse,
              ),
              ItemsPage(
                title: 'Accepted Items',
                items: _items.where((item) => _acceptedItems.contains(item['username'])).toList(),
                onAccept: _handleAccept,
                onRefuse: _handleRefuse,
              ),
              ItemsPage(
                title: 'Unseen Items',
                items: _items.where((item) => !_acceptedItems.contains(item['username']) && !_unseenItems.contains(item['username'])).toList(),
                onAccept: _handleAccept,
                onRefuse: _handleRefuse,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),
);
  }

  void _handleAccept(String username) {
    setState(() {
      _acceptedItems.add(username);
      _unseenItems.remove(username);
    });
  }

  void _handleRefuse(String username) {
    setState(() {
      _acceptedItems.remove(username);
      _unseenItems.add(username);
    });
  }

  void _showRegionOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select a region',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5, // Number of regions
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Region ${index + 1}'),
                        onTap: () {
                          Navigator.pop(context);
                          // Handle region selection
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


 class ItemsPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final Function(String) onAccept;
  final Function(String) onRefuse;

  const ItemsPage({
    Key? key,
    required this.title,
    required this.items,
    required this.onAccept,
    required this.onRefuse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items.map((item) {
            return
Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20), // Add horizontal padding here
  child: Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * 0.9, // Adjust the value as needed
    ),
    child: ExpandableItem(
      username: item['username']!,
      profileImagePath: item['profileImagePath']!,
      description: item['description']!,
      firstName: item['firstName']!,
      lastName: item['lastName']!,
      date: item['date']!,
      phoneNumber: item['phoneNumber']!,
      email: item['email']!,
      onAccept: onAccept,
      onRefuse: onRefuse,
    ),
  ),
)
;
 }).toList(),
        ),
      ),
    );
  }
}

 


