defmodule Website.Cv do
  @moduledoc """
  Static CV content rendered on the /cv page.
  """

  def experience do
    [
      %{
        title: "Full-stack engineer · Vabisabi d.o.o., Ljubljana",
        start_year: 2025,
        end_year: 2026,
        desc:
          "Worked across a range of client projects for companies based in Slovenia and across " <>
            "Europe, spanning web platforms, mobile applications, and AI-powered systems — from " <>
            "architecture and implementation through to delivery.",
        tech:
          "TypeScript, React, Next.js, Flutter, Dart, Python, Firebase, PostgreSQL, MSSQL, Docker, Genkit"
      },
      %{
        title: "Frontend engineer · Landis+Gyr EV solutions, Ljubljana & Škofljica",
        start_year: 2023,
        end_year: 2025,
        desc:
          "Part of a frontend team developing and maintaining an EV charging platform and energy " <>
            "management system. Planned and started the migration to a modern stack from the legacy " <>
            "codebase, substantially improving customer satisfaction and reducing support call volume.",
        tech: "TypeScript, React, Next.js, AngularJS, C#, .NET, Splunk"
      },
      %{
        title: "Full-stack developer · Devleet d.o.o., Ljubljana",
        start_year: 2022,
        end_year: 2023,
        desc:
          "Worked within a small engineering team delivering client projects across web and " <>
            "dashboard products, including a period of contractor work for an established " <>
            "cryptocurrency exchange.",
        tech: "TypeScript, Angular, Vue.js, Svelte, Node.js, Express, Rust, PostgreSQL, AWS"
      },
      %{
        title: "Computer scientist · Stelem d.o.o., Žužemberk",
        start_year: 2019,
        end_year: 2023,
        desc:
          "Planned and developed a full-stack information system for a production company, and " <>
            "provided ongoing IT support and infrastructure maintenance for internal systems and " <>
            "employees.",
        tech:
          "JavaScript, Vue.js, Node.js, Go, Python, PostgreSQL, Docker, self-hosting, project management"
      }
    ]
  end

  def skills do
    [
      %{category: "Frontend", items: "Vue.js, React, Svelte, AngularJS, Next.js"},
      %{category: "Backend", items: "Node.js, Express, .NET Core, Cloud Functions"},
      %{category: "Languages", items: "TypeScript, Go, Rust, C#, Python"},
      %{category: "Databases", items: "PostgreSQL, MSSQL, Firestore"},
      %{category: "Infrastructure", items: "AWS, Firebase, Linux, Docker, Docker Compose"},
      %{category: "AI", items: "Genkit, knowledge graphs, RAG, LangSmith"},
      %{category: "Tools", items: "Git, Agile methodologies, Linear, Jira"}
    ]
  end

  def projects do
    [
      %{
        title: "Admin information system",
        desc:
          "Planned, designed, and implemented a centralised full-stack information system for internal use."
      },
      %{
        title: "Company website",
        desc:
          "Collaborated with the design team to develop a presentational website for a software development agency."
      },
      %{
        title: "Cryptocurrency trading platform",
        desc:
          "Developed frontend components and user interfaces for a cryptocurrency trading platform, " <>
            "focusing on security, usability, and real-time data visualization."
      },
      %{
        title: "Educational platform",
        desc:
          "Planned and developed a web-based dashboard for an educational platform, including " <>
            "coordinating separate design, mobile, backend, and frontend teams."
      },
      %{
        title: "EV charging solution",
        desc:
          "Maintained and developed new features for an electric vehicle charging platform, and " <>
            "planned and developed a new product on an updated tech stack."
      },
      %{
        title: "Real estate rental app",
        desc:
          "Developed the customer-facing web app and back office for a real estate rental platform " <>
            "used by a company renting out commercial spaces to stores and offices."
      },
      %{
        title: "Mobile app",
        desc:
          "Developed a mobile app for a consumer product, improving its BLE connectivity and adding " <>
            "new features, including an AI conversation agent with a specialized knowledge base, plus " <>
            "a CMS for managing published content."
      },
      %{
        title: "AI knowledge ecosystem",
        desc:
          "Designed and developed components of an AI knowledge platform, including knowledge " <>
            "ingestion pipelines, a knowledge graph, a centralized knowledge base, and a conversation " <>
            "agent, providing automated knowledge extraction, semantic data modeling, and AI-assisted " <>
            "information retrieval with reasoning."
      }
    ]
  end

  def education do
    [
      %{
        title: "Computer and Information Science, Bachelor's degree",
        institution: "University of Ljubljana, Faculty of Computer and Information Science",
        note: "Bachelor's thesis: Development of an information system for production company needs"
      },
      %{
        title: "High school graduate",
        institution: "Splošna gimnazija Novo mesto",
        note: nil
      }
    ]
  end

  def languages do
    [
      %{name: "Slovenian", level: "mother tongue"},
      %{name: "English", level: "B2"}
    ]
  end
end
