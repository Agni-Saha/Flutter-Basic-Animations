# third_app_animo

A Flutter App to understand the basic animations using Tweens, animated controllers, AnimatedContainer, TweenAnimationBuilder and AnimatedBuilder. <br/>
<br/>
Along with this, we are also going to know about GestureDetector, initState, Tickers and SingleTickerProviderMixin, and common builder methods. <br/>
<br/>


## Actual Logic

1. Since the animations (some) are actually responsive and dynamic, so we are going to be using the StatefulWidgets.

2. We have three main animations going on here - background animation, a circular dynamic animation and a auto repeating rotating animation. And so, inside the SafeArea widget we have a Stack widget, which we use to stack all these upon one another. <br/>The first element in stack is the background. The second element is a Column widget, which contains the other two animations seperated evenly

3.  <h4>Circular dynamic animation</h4>
    1.  We are covering everything inside the Center Widget, that has the child of GestureDetector Widget, that has the child of AnimatedContainer Widget.<br/><br/>
    2.  The AnimatedContainer is simply a Container widget with some additional properties (duration and curve) to automatically animated when certain properties change their values. We have designed it as a simple circular button with a Text Widget inside it as a child.<br/><br/>
    3.  We have created a state variable called buttonRadius, that we have set has the value for width and height and which we are going to actually change as per response.<br/><br/>
    4.  This AnimatedContainer is the child of GestureDetector Widget, whose work is to simply detect the numerous gestures that's been done it and do appropriate works based on it.<br/><br/>
    5.  What we are doing is we are focusing on the onTap property of it and whenever it's been triggered, we are using the setState method to change the value of buttonRadius.<br/><br/>
    6.  Therefore, what's happenning here is this - whenever we tap on the AnimatedContainer, the onTap property is triggered which modifies the buttonRadius. And since it's modified using setState, so the AnimatedContainer automatically changes its value of width and height.<br/><br/>

4. <h4>Page Transition</h4>
   1. What we are doing here is this - we are defining a tween as a state. And based on that tween's value, we are animating the TweenAnimationBuilder Widget.<br/><br/>
   2. Tween simply gives the intermediate value of anything (color, numbers, alignments, etc.). Generally, we should mention the type we are associating it with using generics.<br/><br/>
   3. The TweenAnimationBuilder has 4 main properties - tween (that takes in the tween value), duration (for the duration of animation), child (for the child upon which the animation will be done) and a builder method (that takes in BuildContext, a double value and an optional Widget using which it's specifying what will happen in animation).<br/><br/>

5. <h4>Repeatedly Rotating Star</h4> 
   1. Here we are using the AnimatedBuilder and AnimationController to make an animation.<br/><br/>
   2. AnimationController is actually a way of controlling an animation, used to simply drive the animation in whatever way we want.<br/><br/>
   3. It has a required property called vsync, that is used to make the animation smoother and faster. This property is provided by TickerProvider Widget (which simply describes a factory of Ticker objects and binds the tickers with external factors). A ticker is simply the refresh rate of our animation. To get this vsync property, we use the SingleTickerProviderMixin with our function.<br/><br/>
   4. We initialize our AnimationController in initState method, which is the first method that runs when the app is stareted (it is only executed once for every app cycle). This is provided in StatefulWidget, and so we need to override it our function.<br/><br/>
   5. Inside the initState, we call the constructor of AnimationController to initialize it, and also start the animation (either by using forward() or repeat()).<br/><br/>
   6. Since the initialization happens after the app runs, so compiler will mark the AnimationController as null, and therefore we need to use force chaining (!.) of methods to run it.<br/><br/>
   7. The animation is defined by AnimatedBuilder Widget, which is pretty similar to TweenAnimationBuilder. It has the properties - animation (that takes in the AnimationController!.view), builder (that takes in a BuildContext and an optional Widget to define what will happen in animation), and a child property (that takes in the widget where the actual animation will happen).<br/><br/>
