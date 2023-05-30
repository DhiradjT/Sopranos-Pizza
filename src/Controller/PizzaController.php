<?php

namespace App\Controller;

use App\Entity\Categoriees;
use App\Entity\Pizzas;
use App\Repository\PizzasRepository;
use Doctrine\Persistence\ManagerRegistry;
use MongoDB\Driver\Manager;
use App\Entity\Contact;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PizzaController extends AbstractController
{

    #[Route('/', name: 'home')]
    public function homePage(ManagerRegistry $doctrine): Response
    {
        $categoriees = $doctrine->getRepository(Categoriees::class)->findAll(); // je haalt met deze actie alle categorieen op uit entity categoriees door middel van doctrine managerregistry en stuurt dit dan op naar bezoeker/home.html.twig met bezoeker als view variabalen
        return $this->render('bezoeker/home.html.twig', ['categoriees' => $categoriees]);
    }

    #[Route('/product/{id}', name: 'product')] // route waar id de placeholder is van de categorie
    public function productPage(ManagerRegistry $doctrine, Categoriees $category, PizzasRepository $pizzasRepository): Response // hier wordt gebruik gemaakt van doctrine managerregistry op deze manier fetch je de pizzas die bij de desbetreffende cateogorie horen
    {
        $products = $pizzasRepository->findBy(['product' => $category]); // Hier stuur je alles door naar doctrine ORM
        $categoriees = $doctrine->getRepository(Categoriees::class)->findAll();

        return $this->render('bezoeker/product.html.twig', [ // Daarna wordt dit allemaal doorgestuurd naar de product.html.twig en op deze pagina staan weer for loops hierdoor kan je de data persisten
            'id' => $category,
            'pizzas' => $products,
            'categoriees' => $categoriees]);
    }




    #[Route('/contact', name: 'contact')] // Hier maak je een form aan met behulp van make:form je handelt de data, valideert het en uiteindelijk rendert het de form op de pagina bezoeker/contact.html.twig
    public function contactPage(Request $request, EntityManagerInterface $entityManager)
    {
        $contact = new Contact();
        $form = $this->createForm(ContactType::class, $contact);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($contact);
            $entityManager->flush();

            return $this->redirectToRoute('contact_success');
        }

        return $this->render('bezoeker/contact.html.twig', [
            'form' => $form->createView(),
        ]);
    }

 #[Route('/contact/success', name:"contact_success")]
    public function contactSuccess()
    {
        return $this->render('bezoeker/success.html.twig');
    }


//    #[Route('/order/{productid}', name:'order_new')]
//    public function new(Request $request, EntityManagerInterface $entityManager, int $productId): Response
//    {
//        $order = new Order();
//        $order->setProduct($productId);
//
//        $form = $this->createForm(OrderFormType::class, $order);
//        $form->handleRequest($request);
//
//        if ($form->isSubmitted() && $form->isValid()) {
//            $entityManager->persist($order);
//            $entityManager->flush();
//
//            return $this->redirectToRoute('order_confirmation');
//        }
//
//        return $this->render('bezoeker/order.html.twig', [
//            'form' => $form->createView(),
//        ]);
//    }




    #[Route('/login', name: 'login')]
    public function loginPage(): Response
    {
        return $this->render('bezoeker/login.html.twig');

    }




}



