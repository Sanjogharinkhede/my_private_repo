const cardData = [
  {
    img: "https://em360tech.com/sites/default/files/2024-05/what-is-computer-architecture.jpeg",
    alt: "internet_arch",
    title: "Computer Architecture - Hardware, Network and Software",
    desc: "Home Network Topology, parallel computing and networked systems,real world examples",
    href: "./All Assignments PDFs/1 Computer Architecture - Hardware, Network and Software.pdf",
  },
  {
    img: "https://avatars.githubusercontent.com/u/18133?s=280&v=4",
    alt: "internet_git",
    title: "Source Code Management with Git",
    desc: " Initialize a new Git repository, Branch Creation and Switching, Feature Branches and Hotfixes ",
    href: "./All Assignments PDFs/2 Source Code Management with Git.pdf",
  },
  {
    img: "https://bashlogo.com/img/symbol/jpg/full_colored_light.jpg",
    alt: "internet_shell_script",
    title: "Shell Scripting with Bash",
    desc: "checks if a specific file exists,odd or even,Create function,create file and content. etc",
    href: "./All Assignments PDFs/3 Shell Scripting with Bash.pdf",
  },
  {
    img: "https://media.istockphoto.com/id/1206991279/vector/the-database-is-an-icon-vector-isolated-contour-symbol-illustration.jpg?s=612x612&w=0&k=20&c=clvt4OniHDuOHgQtEzdo8ushCRGg_uKKKOHEgVLA_hg=",
    alt: "DB",
    title: "RDBMS Fundamentals",
    desc: "ER diagram, constraints, ACID properties, library schema, Indexing, DCL, Bulk Insertion",
    href: "./All Assignments PDFs/4 RDBMS Fundamentals.pdf",
  },
  {
    img: "https://w7.pngwing.com/pngs/747/798/png-transparent-mysql-logo-mysql-database-web-development-computer-software-dolphin-marine-mammal-animals-text-thumbnail.png",
    alt: "MySQL",
    title: "SQL Language",
    desc: "DDL, DML, DQL, DCL, TCL, Transaction logs, data recovery, Subquery, Joins, Union, Transactions",
    href: "./All Assignments PDFs/5 SQL Language.pdf",
  },
  {
    img: "https://e7.pngegg.com/pngimages/988/482/png-clipart-systems-development-life-cycle-software-development-process-computer-software-technology-technology-electronics-text-thumbnail.png",
    alt: "SDLC",
    title: "Introduction to Software Development Life Cycle (SDLC)",
    desc: "Basic SDLC, Phases Requirement, Design, Implementation, Testing, Maintenance, SDLC models V-model, Spiral, Agile , Waterfall",
    href: "./All Assignments PDFs/6 Introduction to Software Development Life Cycle (SDLC).pdf",
  },
  {
    img: "https://www.velvetech.com/wp-content/uploads/2019/08/software-development-life-cycle.jpg",
    alt: "Modern development",
    title: "Modern Development Methodologies",
    desc: "Test driven, Behaviour driven and Functional driven technolgies with images and details with comparisons",
    href: "./All Assignments PDFs/7 Modern Development Methodologies.pdf",
  },
  {
    img: "https://miro.medium.com/v2/resize:fit:400/0*KpzqUReoWU_DEwb5.png",
    alt: "Agile Methodology and Effective communication",
    title: "Agile Methodologies and Effective Communication.pdf",
    desc: "Sprint planning, Scrum details, A feature driven sprint plan, a effective communication in standup task",
    href: "./All Assignments PDFs/8 Agile Methodologies and Effective Communication.pdf",
  },
];

document.addEventListener("DOMContentLoaded", function () {
  const cardBox = document.querySelector(".card_box");
  cardData.forEach((card) => {
    const cardElement = `
          <div class="my_card">
            <div class="hover_bubble"></div>
            <div class="my_icon">
              <img src="${card.img}" alt="${card.alt}">
            </div>
            <div class="card_title">
              <h3>${card.title}</h3>
            </div>
            <div class="card_desc">
              <p>${card.desc}</p>
              <a class="pdf_link" href="${card.href}" target="_blank">View PDF</a>
            </div>
          </div>
          `;
    cardBox.innerHTML += cardElement;
  });
});