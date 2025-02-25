<?php

namespace App\Entity;

use App\Repository\CardRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation as Serializer;

#[ORM\Entity(repositoryClass: CardRepository::class)]
class Card implements EntityInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Serializer\Groups(['API.GET'])]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Serializer\Groups([
        'API.GET',
        'API.POST',
        'API.PUT',
        'API.DELETE'
    ])]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    #[Serializer\Groups([
        'API.GET',
        'API.POST',
        'API.PUT',
        'API.DELETE'
    ])]
    private ?string $player = null;

    #[ORM\Column(length: 255)]
    #[Serializer\Groups([
        'API.GET',
        'API.POST',
        'API.PUT',
        'API.DELETE'
    ])]
    private ?string $team = null;

    #[ORM\Column]
    #[Serializer\Groups([
        'API.GET',
        'API.POST',
        'API.PUT',
        'API.DELETE'
    ])]

    private ?int $year = null;

    #[ORM\Column]
    #[Serializer\Groups([
        'API.GET',
        'API.POST',
        'API.PUT',
        'API.DELETE'
    ])]
    private ?string $imageUrl = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): Card
    {
        $this->name = $name;

        return $this;
    }

    public function getPlayer(): ?string
    {
        return $this->player;
    }

    public function setPlayer(string $player): Card
    {
        $this->player = $player;

        return $this;
    }

    public function getTeam(): ?string
    {
        return $this->team;
    }

    public function setTeam(string $team): Card
    {
        $this->team = $team;

        return $this;
    }

    public function getYear(): ?int
    {
        return $this->year;
    }

    public function setYear(int $year): Card
    {
        $this->year = $year;

        return $this;
    }


    public function getImageUrl(): ?string
    {
        return $this->imageUrl;
    }


    public function setImageUrl(string $imageUrl): Card
    {
        $this->imageUrl = $imageUrl;

        return $this;
    }
}
