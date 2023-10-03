class Products {
  final String? title, description, reviews, price, rating, picture;

  Products(
      {this.title,
      this.description,
      this.picture,
      this.reviews,
      this.rating,
      this.price});
}

// ignore: non_constant_identifier_names
List<Products> demo_products = [
  Products(
    reviews: "50",
    price: "50",
    title: "Coffee Table",
    description:
        'Discover the perfect blend of style and functionality with our Coffee Table. This exquisite piece adds elegance to your living space. Crafted with precision, its a true masterpiece. Elevate your decor with our Coffee Table.',
    rating: "4.5",
    picture: "images/coffeetable.jpeg",
  ),
  Products(
    reviews: "50",
    price: "20",
    title: "Coffee Chair",
    description:
        'Experience the future of social media with our Coffee Chair. This app allows users to connect, post, and customize their profiles effortlessly. Stay connected in real-time. Socialize with ease.',
    rating: "3.5",
    picture: "images/chair.jpeg",
  ),
  Products(
    reviews: "50",
    price: "25",
    title: "Minimal Stand",
    description:
        'Navigate your world with ease using Google Maps Routes. Discover new places, pinpoint your destination, and create routes with confidence. Enjoy custom info windows and easy pinpointing.',
    rating: "4.0",
    picture: "images/stand.jpeg",
  ),
  Products(
    reviews: "50",
    price: "50",
    title: "Minimal Desk",
    description:
        "The Minimal Desk offers a perfect blend of form and function. Its minimalist design complements any workspace, while its spacious surface provides ample room for productivity. Crafted with precision, this desk combines elegance and practicality, making it an ideal choice for those seeking a modern and efficient workspace solution.",
    rating: "4.2",
    picture: "images/desk.jpeg",
  ),
  Products(
    reviews: "50",
    price: "12",
    title: "Minimal Lamp",
    description:
        "The Minimal Lamp combines elegant design with practicality. Its sleek and modern aesthetic seamlessly blends into any room, providing gentle illumination. Crafted with attention to detail, this lamp enhances both functionality and aesthetics, making it an ideal addition to your home or workspace.",
    rating: "4.7",
    picture: "images/lamp.jpeg",
  ),
  Products(
    reviews: "50",
    price: "35",
    title: "Sofa",
    description:
        "The Sofa is the epitome of comfort and style. With its sleek design and plush cushions, it's the perfect addition to any living space. Whether you're lounging with a book or entertaining guests, this sofa offers both relaxation and elegance. Crafted with care and attention to detail, it's a statement piece that enhances the ambiance of your home.",
    rating: "4.5",
    picture: "images/pic_one.png",
  ),
];
