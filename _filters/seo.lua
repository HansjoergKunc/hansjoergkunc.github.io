-- Injects a canonical URL and og:url on every page, plus schema.org Person
-- structured data on the homepage. Keeps the site's identity pinned to the
-- custom domain so search engines do not split ranking across hostnames.

local SITE = "https://hansjoergkunc.com"

function Pandoc(doc)
  local input = quarto.doc.input_file or ""
  input = input:gsub("\\", "/")
  local base = input:match("([^/]+)%.qmd$")
  if not base then
    return doc
  end

  local path = (base == "index") and "/" or ("/" .. base .. ".html")
  local url = SITE .. path

  local head = '<link rel="canonical" href="' .. url .. '">\n'
    .. '<meta property="og:url" content="' .. url .. '">\n'

  if base == "index" then
    head = head .. [[
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Person",
  "name": "Hansjoerg Kunc",
  "givenName": "Hansjoerg",
  "familyName": "Kunc",
  "jobTitle": "Senior Lecturer in Animal Behaviour",
  "url": "https://hansjoergkunc.com",
  "image": "https://hansjoergkunc.com/images/profile.jpg",
  "worksFor": {
    "@type": "CollegeOrUniversity",
    "name": "Queen's University Belfast"
  },
  "knowsAbout": [
    "Animal behaviour",
    "Anthropogenic noise pollution",
    "Behavioural ecology",
    "Animal communication",
    "Meta-analysis"
  ],
  "sameAs": [
    "https://orcid.org/0000-0003-4709-1352",
    "https://scholar.google.com/citations?user=Cy-kscYAAAAJ&hl=en",
    "https://pure.qub.ac.uk/en/persons/hansjoerg-kunc/",
    "https://github.com/hansjoergkunc"
  ]
}
</script>
]]
  end

  quarto.doc.include_text("in-header", head)
  return doc
end
