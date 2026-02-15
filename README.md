# Hansjoerg Kunc - Academic Website

Personal academic website built with Quarto and hosted on GitHub Pages.

## Local Development

### Prerequisites
- [Quarto](https://quarto.org/docs/get-started/) installed

### Preview locally
```bash
quarto preview
```

### Build the site
```bash
quarto render
```

The rendered site is output to the `docs/` folder.

## Deployment to GitHub Pages

### Initial Setup

1. Create a repository on GitHub named `hansjoergkunc.github.io`

2. Push this code to the repository:
```bash
git remote add origin https://github.com/hansjoergkunc/hansjoergkunc.github.io.git
git add .
git commit -m "Initial website setup"
git push -u origin main
```

3. Configure GitHub Pages:
   - Go to repository Settings > Pages
   - Under "Source", select "Deploy from a branch"
   - Under "Branch", select `main` and `/docs` folder
   - Click Save

4. Your site will be available at: https://hansjoergkunc.github.io

### Custom Domain Setup

1. Go to your domain registrar and add these DNS records:
   - A record: `185.199.108.153`
   - A record: `185.199.109.153`
   - A record: `185.199.110.153`
   - A record: `185.199.111.153`
   - Or CNAME record pointing to `hansjoergkunc.github.io`

2. In GitHub repository Settings > Pages:
   - Enter your custom domain in the "Custom domain" field
   - Check "Enforce HTTPS" (after DNS propagates)

3. Create a CNAME file in the docs folder with your domain:
```bash
echo "yourdomain.com" > docs/CNAME
```

### Updating the Site

After making changes to .qmd files:
```bash
quarto render
git add .
git commit -m "Update website content"
git push
```

## Customization

- **Content**: Edit the `.qmd` files
- **Theme colors**: Modify `custom.scss`
- **Site structure**: Edit `_quarto.yml`
- **Images**: Add to the `images/` folder
- **Files (CV, etc.)**: Add to the `files/` folder

## File Structure

```
.
├── _quarto.yml          # Quarto configuration
├── custom.scss          # Custom theme styles
├── styles.css           # Additional CSS
├── index.qmd            # Homepage
├── research.qmd         # Research overview
├── research-*.qmd       # Research sub-pages
├── publications.qmd     # Publications page
├── teaching.qmd         # Teaching page
├── news.qmd             # News page
├── cv.qmd               # CV page
├── contact.qmd          # Contact page
├── images/              # Image assets
├── files/               # Downloadable files
└── docs/                # Rendered site (for GitHub Pages)
```
