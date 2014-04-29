Dynamic-Buttons-Demo
====================

A simple demo to show how to create button dynamically on xCode 5 for iOS 7

====================

Sometimes we need to create buttons dynamically for some particular app.

So here's a simple way to do it, generating a series of UIButtons from an array of texts (of course, the origin of the text could be any data origin).

Besides we're going to use the homogeneousFontFor function (https://github.com/rbasurto/homogeneousFont) to define the right font for the UIButtons.

The button generation is made with:

UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];

And the method designation when which ever button is selected will be:
	
[button addTarget:self action:@selector(pushButtonDemo:) forControlEvents:UIControlEventTouchUpInside];



====================

Hay ocasiones en las que necesitamos crear botones en forma dinámica para alguna aplicación.

Aquí pondremos un código muy sencillo con algo muy básico para generar una serie de UIButtons en base a textos provenientes en este caso de un arreglo (aunque el origen de los textos para los botones puede ser cualquier origen de datos).

Además usaremos también la función homogeneousFontFor (https://github.com/rbasurto/homogeneousFont) que nos determinará el tamaño de la fuente adecuado para el conjunto de botones de forma que éstos se vean homogéneos en base a su tamaño.

La generación del botón se hace con:
	
UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];

Y la asignación del método que va a procesar el evento cuando se seleccione el botón:
	
[button addTarget:self action:@selector(pushButtonDemo:) forControlEvents:UIControlEventTouchUpInside];
