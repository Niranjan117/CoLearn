$file = 'wp-content/themes/dka/public/colearn-branding.js'
$content = [System.IO.File]::ReadAllText("$pwd/$file", [System.Text.Encoding]::UTF8)

$oldSimResponse = @'
      if (q.includes("simulation") || q.includes("sim") || q.includes("vr") || q.includes("cardboard") || q.includes("3d") || q.includes("dam") || q.includes("wind") || q.includes("solar")) {
        return `You can launch 3 interactive full-screen energy learning simulations:\n\n` +
          `• **<a href="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html" target="_blank">Hydroelectric Power Simulation ↗</a>**\n` +
          `• **<a href="/Solar/Solar%20Panel/mm/neue-energien/solarthermie/index.html" target="_blank">Solar Thermal Simulation ↗</a>**\n` +
          `• **<a href="/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/index.html" target="_blank">Wind Power Generation Simulation ↗</a>**\n\n` +
          `All simulations launch directly in a **new tab** from the **<a href="/academy/simulations/">Simulations Page</a>**.`;
      }

      if (q.includes("course") || q.includes("safety") || q.includes("forklift") || q.includes("digital") || q.includes("learn") || q.includes("certificate")) {
        return `CoLearn offers structured vocational courses with recognized certifications:\n\n` +
          `• **Site Safety Essentials**: 6 modules on PPE, hazard spotting and site protocols.\n` +
          `• **Forklift Operations**: 8 modules on pre-use inspection, load stability and maneuvering.\n` +
          `• **Digital Tools on Site**: 5 modules on digital building plans and work records.\n\n` +
          `Browse full modules on **<a href="/academy/courses/">Courses</a>** or track your progress in the **<a href="/academy/learner/">Learner Hub</a>**.`;
      }

      if (q.includes("lecture") || q.includes("video") || q.includes("youtube") || q.includes("watch")) {
        return `We offer video lectures with practical demonstrations:\n\n` +
          `• **Working safely at height**\n` +
          `• **Forklift pre-use inspections**\n` +
          `• **Hydroelectric generation**\n` +
          `• **Wind turbine operation & maintenance**\n\n` +
          `Watch them all on the **<a href="/academy/lectures/">Video Lectures Page</a>**.`;
      }
'@

$newSimResponse = @'
      if (q.includes("simulation") || q.includes("sim") || q.includes("vr") || q.includes("cardboard") || q.includes("3d") || q.includes("dam") || q.includes("wind") || q.includes("solar")) {
        return `You can launch 3 interactive energy simulations with video walkthroughs:\n\n` +
          `• **<a href="/Dam/Dam%20Simulation/mm/neue-energien/wasserkraft/index.html" target="_blank">Hydroelectric Power Plant (Francis Turbine & Penstock) ↗</a>**\n` +
          `• **<a href="/Solar/Solar%20Panel/mm/neue-energien/solarthermie/index.html" target="_blank">Solar Thermal Circulation (Vacuum Tube Collectors & Glycol Loop) ↗</a>**\n` +
          `• **<a href="/Wind%20Power/Wind%20Power/mm/neue-energien/windkraft/index.html" target="_blank">Wind Power Generation (Aerodynamic Pitch & Yaw Controls) ↗</a>**\n\n` +
          `All simulations launch in a **new tab** and feature dedicated **video walkthroughs** on our **<a href="/academy/simulations/">Simulations Page</a>**.`;
      }

      if (q.includes("course") || q.includes("safety") || q.includes("forklift") || q.includes("digital") || q.includes("learn") || q.includes("certificate") || q.includes("clean energy") || q.includes("automation") || q.includes("plc") || q.includes("electrical")) {
        return `CoLearn offers 6 accredited vocational courses aligned with CITB, City & Guilds and EUSR standards:\n\n` +
          `1. **Site Safety Essentials** (NCCT Level 2 · 6 Modules · CSCS Route)\n` +
          `2. **Forklift & Plant Operations** (NCCT Level 2 · 8 Modules · RTITB/FLTA)\n` +
          `3. **Digital Tools on Site** (NCCT Level 2 · 5 Modules · BIM Ready)\n` +
          `4. **Renewable Energy Systems (Wind & Solar)** (NCCT Level 3 · 7 Modules)\n` +
          `5. **Industrial Automation & PLC Logic** (NCCT Level 3 · 8 Modules)\n` +
          `6. **Electrical Safety & Safe Isolation** (NCCT Level 3 · 6 Modules · 18th Edition Prep)\n\n` +
          `Browse all courses on **<a href="/academy/courses/">Courses</a>** or track your progress in the **<a href="/academy/learner/">Learner Hub</a>**.`;
      }

      if (q.includes("lecture") || q.includes("video") || q.includes("youtube") || q.includes("watch")) {
        return `We provide 10 practical technical demonstrations and simulation walkthroughs:\n\n` +
          `• **Simulation Walkthroughs**: Hydroelectric Dam Flow, Wind Turbine Nacelle Controls, Solar Thermal Closed-Loop, and Virtual Lab Diagnostics.\n` +
          `• **Site Demonstrations**: Working safely at height, Forklift pre-use inspections, Industrial automation & PLC, Safe isolation (LOTO), and 360 Excavator groundworks.\n\n` +
          `Watch them all on the **<a href="/academy/lectures/">Video Lectures Page</a>** or on the **<a href="/academy/simulations/#simulation-videos">Simulations Page</a>**.`;
      }
'@

# Normalize and replace
$normContent = $content -replace "\r\n", "`n"
$normOld = $oldSimResponse -replace "\r\n", "`n"
$normNew = $newSimResponse -replace "\r\n", "`n"

if ($normContent.Contains($normOld)) {
    $normContent = $normContent.Replace($normOld, $normNew)
    $clean = $normContent.Replace("Â·", "·").Replace("Â&middot;", "·")
    $res = $clean -replace "`n", "`r\n"
    [System.IO.File]::WriteAllText("$pwd/$file", $res, [System.Text.Encoding]::UTF8)
    Write-Output "SUCCESS: Updated chatbot responses in colearn-branding.js with 6 courses & simulation videos"
} else {
    Write-Output "ERROR: Could not match old chatbot response block"
}
