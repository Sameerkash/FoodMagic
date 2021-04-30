# FoodMagic ✨

**An Augmendted Reailty app Food app built with Flutter and AR**

**CheckList**

- [x] Test Flutter with Unity Integration
- [x] Basic UI screens
- [ ] Complex UI screens
- [ ] Backend Integration with app write
- [ ] Basic Blender Models
- [ ] Complex Blender Models
- [ ] Unity AR/AR core integraiton
- [ ] Unit Testing
- [ ] Relase Configuration

### Development

If you wish to contribute to this repository, please fork the repository, make your chnages on a new branch and make a pull request.

**Setup AppWrite**

[AppWrite](https://appwrite.io) is required to run this project succesfully.

FoodMagic uses AppWrite as a backend as a service for storing data, authentication and file storage.

Once you have appwrite successfully running as a docker container,

- Create a new Project, name it foodmagic
- Click on add app and select Flutter
- Enter the app details, be sure enter `com.example.foodmagic` as the domain
- Go to Project settings and copy your `projectId`
- Navigate to the flutter project, which is at `FoodMagic/foodmagic`
- create a `.env` file at the root and copy the contents from .env.example
- In the `.env` file, add the `projectId` you just copied.
- If you're running on an emulator, insert `localhost` as the value for `IP` else use the IP adress of you PC if you're using a physical device.

