S// 1 ------------------------------------------------------------
// Tworzymy scenę,na której będą rozgrywały się wydarzenia:
// Bedzie to klasa Kosmos dziedzicząca po klasie SKScene


// 2 ------------------------------------------------------------
// w kontrolerze tworzymy i inicjujemy tę scenę

let scene = Kosmos(size: view.bounds.size) // Utworzenie instancji sceny
let skView = view as! SKView

// Komunikaty kontrolne
skView.showsFPS = true
skView.showsNodeCount = true

scene.scaleMode = .resizeFill // Ma zajmować cały ekran

// Wyświetlenie sceny
skView.presentScene(scene)


// 3 ------------------------------------------------------------
// Inicjujemy wygląd sceny
// W tym celu tworzymy metodę wywoływaną po pojawieniu się view sceny na ekranie

override func didMove(to view: SKView) {
	backgroundColor = SKColor.blue // przykładowy paremetr wyglądu sceny
}

// 3a ------------------------------------------------------------
// Tworzymy emiter (rain)

// Wczytanie emitera do sceny
let starField = SKEmitterNode(fileNamed: "FallingStars")
starField?.position = CGPoint(x: size.width/2, y: size.height/2)
starField?.zPosition = -1000

// Dodanie emitera do sceny
addChild(starField!)

// 4 ------------------------------------------------------------
// Tworzymy statek
// Bedzie to klasa SpaceShip dziedzicząca po SKSpriteNode
// Do zasobów trzeba wstawić obrazek

init() {
	let texture = SKTexture(imageNamed: "ship1")
	super.init(texture: texture, color: SKColor.clear, size: texture.size())
}
required init?(coder aDecoder: NSCoder) {
	super.init(coder: aDecoder)
}

// 4a ------------------------------------------------------------
// Wczytujemy statek na scenę
let ship = SpaceShip()

// Dodanie statku do sceny
ship.position = CGPoint(x:self.frame.midX, y:ship.size.height/2 + 10)
addChild(ship)

// 4b ------------------------------------------------------------
// Tworzymy animację statku
// Trzeba wczytać drugi obrazek i zmodyfikować init statku:
// Uruchomoienie "na zawsze" akcji wymieniania rysunków statku (zawartych w tablicy): animacja statku
let shipTextures:[SKTexture] = [SKTexture(imageNamed: "ship1"), SKTexture(imageNamed: "ship2")]
self.run(SKAction.repeatForever( SKAction.animate(with: shipTextures, timePerFrame: 0.1)))


// 4c ------------------------------------------------------------
// przesuwanie statku do nowego położenia X
func move(_ newX: CGFloat){
	run(SKAction.move(to: CGPoint(x: newX, y: self.position.y ), duration: 0.001))
}


// obsluga tapnięcia i przesuwania palcem
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
	self.ship.move((touches.first?.location(in: self).x)!)
}


// 4d ------------------------------------------------------------
// Tapnięcie musi być jednak nie w dowolnym miejscu, ale w obrębie statku

for touch in touches{
	let nodes = self.nodes(at: touch.location(in: self))
	for node in nodes {
		if node.isKind(of: SpaceShip.self) {
			self.ship.move(touch.location(in: self).x)
		}
	}
}



// 5 ------------------------------------------------------------
// Tworzymy klasy pocisku
// Ponieważ pocisk i bomba mają wspólne cechy najpierw tworzymy klasę bazową

// klasa pocisku (bazowa)
class Bullet: SKSpriteNode {
	
	init(imageName: String, bulletSound: String?) {
		let texture = SKTexture(imageNamed: imageName)
		super.init(texture: texture, color: SKColor.clear, size: texture.size())
		
		if(bulletSound != nil){ run(SKAction.playSoundFileNamed(bulletSound!, waitForCompletion: false)) }
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}


// 5a ------------------------------------------------------------
// Wystrzał ze statku to ShipBullet
// trzeba też wczytać zasoby

init(){
	super.init(imageName: "bullet", bulletSound: "bullet.mp3")
}

required init?(coder aDecoder: NSCoder) {
	super.init(coder: aDecoder)
}


// 5b ------------------------------------------------------------

// Animacja lecącej kuli
func animate(_ scene: SKScene){
	let moveBulletAction = SKAction.move(
		to: CGPoint(x:self.position.x, y:scene.size.height + self.size.height),
		duration: 1.0)
	run(SKAction.sequence([moveBulletAction, SKAction.removeFromParent()]))
}


// 5c ------------------------------------------------------------
// Realizacja strzału

// W klasie ship
func fire(scene: SKScene){
	// Utworzenie pocisku
	let bullet = ShipBullet()
	bullet.position.x = self.position.x
	bullet.position.y = self.position.y + self.size.height/2
	scene.addChild(bullet) // dodanie pocisku do sceny
	
	bullet.animate(scene)
}

// W klasie Kosmos
// 5d ------------------------------------------------------------

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
	ship.fire(scene: self)
}


// 6a ------------------------------------------------------------

// 6b ------------------------------------------------------------


// 6c ------------------------------------------------------------



// 6d ------------------------------------------------------------

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------




