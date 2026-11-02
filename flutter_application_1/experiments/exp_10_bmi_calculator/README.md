# Experiment 10: Mini Project - BMI Calculator App

## Aim
To develop a mobile application for the calculation and interpretation of Body Mass Index (BMI) using Flutter widgets and interactive state handling.

## Mathematical Formulation
$$\text{BMI} = \frac{\text{Weight (kg)}}{\left(\frac{\text{Height (cm)}}{100}\right)^2}$$

### Classification Criteria:
- **Underweight**: $\text{BMI} < 18.5$
- **Normal**: $18.5 \le \text{BMI} < 25.0$
- **Overweight**: $\text{BMI} \ge 25.0$

## UI Design & Components
- **Input Page**:
  - Gender selection toggle (Male / Female) with active highlight color
  - Height slider with custom pink thumb (`#EB1555`)
  - Floating circular buttons for incrementing/decrementing Weight and Age
  - Bottom action container: `CALCULATE RESULT`
- **Result Page**:
  - Displays calculated BMI value (e.g., `20.8`)
  - Classification title (`NORMAL` in green)
  - Health feedback message: *"Normal, Good job keep it up!"* (matches manual screenshot on page 46)
  - `GO BACK` button to re-calculate

## File
- `lib/main.dart`: Complete runnable Flutter BMI calculator matching manual screenshots.

## Result
The Body Mass Index (BMI) calculator application has been developed and executed successfully.
