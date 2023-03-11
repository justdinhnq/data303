{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "f8f0f1e4",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:16.739732Z",
     "iopub.status.busy": "2023-03-11T19:43:16.738146Z",
     "iopub.status.idle": "2023-03-11T19:43:18.081605Z",
     "shell.execute_reply": "2023-03-11T19:43:18.080247Z"
    },
    "papermill": {
     "duration": 1.352192,
     "end_time": "2023-03-11T19:43:18.083690",
     "exception": false,
     "start_time": "2023-03-11T19:43:16.731498",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    },
    {
     "data": {
      "text/html": [],
      "text/latex": [],
      "text/markdown": [],
      "text/plain": [
       "character(0)"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0ffb51c9",
   "metadata": {
    "papermill": {
     "duration": 0.00394,
     "end_time": "2023-03-11T19:43:18.092069",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.088129",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "1. \n",
    "\n",
    "a. Unknown parameters to be estimated: β0, β1, . . ., βp, σ2\n",
    "\n",
    "b. 2 methods can be used to estimate the unknown parameters in a linear regression model: Least squares method, maximum likelihood estimation\n",
    "\n",
    "c. Difference between a CI and a PI (confidence interval vs. prediction interval) in the context of prediction from a linear model: \n",
    "\n",
    "- CI: measures uncertainty about the predicted mean response\n",
    "- while PI: measures uncertainty about a predicted individual Y observation\n",
    "\n",
    "2. UN98 dataset contains social indicators on 207 countries. Investigate factors associated with infant mortality"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "5cc72e72",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.124980Z",
     "iopub.status.busy": "2023-03-11T19:43:18.101708Z",
     "iopub.status.idle": "2023-03-11T19:43:18.211081Z",
     "shell.execute_reply": "2023-03-11T19:43:18.209801Z"
    },
    "papermill": {
     "duration": 0.11717,
     "end_time": "2023-03-11T19:43:18.213196",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.096026",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: carData\n",
      "\n",
      "\n",
      "Attaching package: ‘car’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    recode\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    some\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(car)\n",
    "data(UN98)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "4ba1ac52",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.225355Z",
     "iopub.status.busy": "2023-03-11T19:43:18.224002Z",
     "iopub.status.idle": "2023-03-11T19:43:18.287798Z",
     "shell.execute_reply": "2023-03-11T19:43:18.286373Z"
    },
    "papermill": {
     "duration": 0.072125,
     "end_time": "2023-03-11T19:43:18.289897",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.217772",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "library(dplyr)\n",
    "un2 <- dplyr::select(UN98, \n",
    "                     infantMortality, region, tfr, GDPperCapita,\n",
    "                     economicActivityFemale, illiteracyFemale)\n",
    "un2 <- na.omit(un2) # omits all rows with missing observations"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8d649ebe",
   "metadata": {
    "papermill": {
     "duration": 0.004302,
     "end_time": "2023-03-11T19:43:18.298837",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.294535",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "a. fit the linear model with the response variable, infantMortality and all the other variables as predictors. Then, write the equation of the fitted model."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "280e2222",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.310431Z",
     "iopub.status.busy": "2023-03-11T19:43:18.309184Z",
     "iopub.status.idle": "2023-03-11T19:43:18.422577Z",
     "shell.execute_reply": "2023-03-11T19:43:18.420914Z"
    },
    "papermill": {
     "duration": 0.12238,
     "end_time": "2023-03-11T19:43:18.425580",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.303200",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|           &nbsp;           |  Estimate  | Std. Error | t value | Pr(>|t|)  |\n",
      "|:--------------------------:|:----------:|:----------:|:-------:|:---------:|\n",
      "|      **(Intercept)**       |   -17.46   |   9.347    | -1.868  |  0.06418  |\n",
      "|     **regionAmerica**      |   -4.48    |   5.223    | -0.8578 |  0.3927   |\n",
      "|       **regionAsia**       |     -2     |   4.657    | -0.4294 |  0.6684   |\n",
      "|      **regionEurope**      |   -1.13    |   6.502    | -0.1739 |  0.8623   |\n",
      "|     **regionOceania**      |   -15.28   |   6.984    | -2.187  |  0.03069  |\n",
      "|          **tfr**           |   10.35    |   1.654    |  6.255  | 6.593e-09 |\n",
      "|      **GDPperCapita**      | -0.0009385 | 0.0002896  |  -3.24  | 0.001551  |\n",
      "| **economicActivityFemale** |   0.4038   |   0.0906   |  4.457  | 1.901e-05 |\n",
      "|    **illiteracyFemale**    |   0.5177   |  0.09575   |  5.406  | 3.409e-07 |\n",
      "\n",
      "\n",
      "\n",
      "| Observations | Residual Std. Error | $R^2$  | Adjusted $R^2$ |\n",
      "|:------------:|:-------------------:|:------:|:--------------:|\n",
      "|     127      |        16.32        | 0.8006 |     0.7871     |\n",
      "\n",
      "Table: Summary of fitted model\n",
      "\n"
     ]
    }
   ],
   "source": [
    "model <- infantMortality ~ region + tfr + GDPperCapita + economicActivityFemale + illiteracyFemale\n",
    "fit1 <- lm(model, data = un2)\n",
    "\n",
    "library(pander)\n",
    "pander(summary(fit1), caption = \"Summary of fitted model\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8d97d1c1",
   "metadata": {
    "papermill": {
     "duration": 0.004491,
     "end_time": "2023-03-11T19:43:18.434785",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.430294",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The equation of fited model:\n",
    "\n",
    "\\widehat{infantMortality} = -17.46 - 4.48*regionAmerica - 2*regionAsia - 1.13*regionEurope - 15.28*regionOceania + 10.35*tfr - 0.00094*GDPperCapita + 0.4 *economicActivityFemale + 0.52*illiteracyFemale\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1ddc9057",
   "metadata": {
    "papermill": {
     "duration": 0.004296,
     "end_time": "2023-03-11T19:43:18.443728",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.439432",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "b. does it make practical sense to interpret the intercep in this case?\n",
    "\n",
    "Answer: no as the lowest value of GDPperCapita in the dataset is 36, and the model therefore does not apply for GDPperCapita values close to zero\n",
    "\n",
    "c. give an interpretation of the coefficient for GDPperCapita\n",
    "\n",
    "Answer: an increase in GDPperCapita by 1 dollar is associated with a reduction in expected infantMortality of 0.0009385 infant deaths per 1000 live births, when all other predictors are kept constant\n",
    "\n",
    "d. give an interpretation of the coefficient for regionAmerica\n",
    "\n",
    "Answer: the expected infant mortality rate in the America region was lower than that in the African region by 4.48 infant deaths per 1000 live births, when all other predictors are kept constant\n",
    "\n",
    "e.  an estimate of σ2 for the model (σ: residual standard error)\n",
    "\n",
    "Answer: σ2 = 16.32^2 = 266.34\n",
    "\n",
    "f. obtain and print confidence and prediction intervals for the first 3 countries\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "e0144513",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.456350Z",
     "iopub.status.busy": "2023-03-11T19:43:18.454591Z",
     "iopub.status.idle": "2023-03-11T19:43:18.480266Z",
     "shell.execute_reply": "2023-03-11T19:43:18.478642Z"
    },
    "papermill": {
     "duration": 0.036167,
     "end_time": "2023-03-11T19:43:18.484472",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.448305",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|     &nbsp;      |  fit  |  lwr  |  upr  |\n",
      "|:---------------:|:-----:|:-----:|:-----:|\n",
      "| **Afghanistan** | 96.16 | 84.57 | 107.8 |\n",
      "|   **Algeria**   | 50.07 | 39.98 | 60.15 |\n",
      "|  **Argentina**  | 16.25 | 10.06 | 22.44 |\n",
      "\n",
      "Table: Confidence intervals\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(pander)\n",
    "xdata <- subset(\n",
    "    un2[1:3,],\n",
    "    select = -c(infantMortality)\n",
    ")\n",
    "pander(\n",
    "    predict(fit1, newdata=xdata, interval=\"confidence\"),\n",
    "    caption = \"Confidence intervals\",\n",
    "    round = 2\n",
    ")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d49d33f3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.496682Z",
     "iopub.status.busy": "2023-03-11T19:43:18.495433Z",
     "iopub.status.idle": "2023-03-11T19:43:18.514623Z",
     "shell.execute_reply": "2023-03-11T19:43:18.512667Z"
    },
    "papermill": {
     "duration": 0.027629,
     "end_time": "2023-03-11T19:43:18.516829",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.489200",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|     &nbsp;      |  fit  |  lwr   |  upr  |\n",
      "|:---------------:|:-----:|:------:|:-----:|\n",
      "| **Afghanistan** | 96.16 | 61.83  | 130.5 |\n",
      "|   **Algeria**   | 50.07 | 16.21  | 83.93 |\n",
      "|  **Argentina**  | 16.25 | -16.66 | 49.16 |\n",
      "\n",
      "Table: Prediction intervals\n",
      "\n"
     ]
    }
   ],
   "source": [
    "pander(\n",
    "    predict(fit1, newdata=xdata, interval=\"prediction\"),\n",
    "    round = 2,\n",
    "    caption = \"Prediction intervals\"\n",
    ")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "28b4b8df",
   "metadata": {
    "papermill": {
     "duration": 0.004674,
     "end_time": "2023-03-11T19:43:18.526449",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.521775",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "g. comment on potential redundancy of some of the preddictors\n",
    "\n",
    "Answer: the adjusted R^2 value (0.787) is lower than the R^2 value (0.801) indicating that there are potentially redundant predictors in the model\n",
    "\n",
    "h. based on the global usefulness test, is it worth going on to further analyze and interpret a model of infantMortality against the predictors?\n",
    "\n",
    "Answer: global usefulness test - we use the output from"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "71f11e8b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.539403Z",
     "iopub.status.busy": "2023-03-11T19:43:18.537974Z",
     "iopub.status.idle": "2023-03-11T19:43:18.559555Z",
     "shell.execute_reply": "2023-03-11T19:43:18.557659Z"
    },
    "papermill": {
     "duration": 0.030685,
     "end_time": "2023-03-11T19:43:18.562077",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.531392",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = model, data = un2)\n",
       "\n",
       "Residuals:\n",
       "    Min      1Q  Median      3Q     Max \n",
       "-40.968  -8.774  -2.266   6.944  57.838 \n",
       "\n",
       "Coefficients:\n",
       "                         Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)            -1.746e+01  9.347e+00  -1.868  0.06418 .  \n",
       "regionAmerica          -4.480e+00  5.223e+00  -0.858  0.39274    \n",
       "regionAsia             -2.000e+00  4.657e+00  -0.429  0.66843    \n",
       "regionEurope           -1.130e+00  6.502e+00  -0.174  0.86227    \n",
       "regionOceania          -1.528e+01  6.984e+00  -2.187  0.03069 *  \n",
       "tfr                     1.035e+01  1.654e+00   6.255 6.59e-09 ***\n",
       "GDPperCapita           -9.385e-04  2.896e-04  -3.240  0.00155 ** \n",
       "economicActivityFemale  4.038e-01  9.060e-02   4.457 1.90e-05 ***\n",
       "illiteracyFemale        5.177e-01  9.575e-02   5.406 3.41e-07 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 16.32 on 118 degrees of freedom\n",
       "Multiple R-squared:  0.8006,\tAdjusted R-squared:  0.7871 \n",
       "F-statistic: 59.22 on 8 and 118 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(fit1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3aca54a4",
   "metadata": {
    "papermill": {
     "duration": 0.004687,
     "end_time": "2023-03-11T19:43:18.572180",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.567493",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "to test the hypotheses: H0 : β1 = β2 = . . . = βp = 0 vs H1 : at least one βj != 0\n",
    "\n",
    "We have very strong evidence (F=59.22, p-value<2.2e-16) to reject the null hypothesis. Therefore it is worth going on to further analyze and interpret a model of infantMortality against the five predictors as the test indicates that at least one of the predictors is an important predictor of infantMortality\n",
    "\n",
    "i. extract the model evaluation statistics from relevant output and present these in a table."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "4fc812b6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.584962Z",
     "iopub.status.busy": "2023-03-11T19:43:18.583679Z",
     "iopub.status.idle": "2023-03-11T19:43:18.651389Z",
     "shell.execute_reply": "2023-03-11T19:43:18.649843Z"
    },
    "papermill": {
     "duration": 0.076372,
     "end_time": "2023-03-11T19:43:18.653431",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.577059",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|   Statistic    |  Value   |\n",
      "|:--------------:|:--------:|\n",
      "|  F-statistic   |   59.2   |\n",
      "|    p-value     | 9.49e-38 |\n",
      "|   R-squared    |  0.801   |\n",
      "| Adj. R-squared |  0.787   |\n",
      "\n",
      "Table: Model assessment summary\n",
      "\n"
     ]
    }
   ],
   "source": [
    "summ.fit <- summary(fit1) # save summary table\n",
    "Rsq <- summ.fit$r.squared # extract Rsq\n",
    "AdjRsq <- summ.fit$adj.r.square # extract adjusted Rsq\n",
    "\n",
    "# y~1: fit the intercept only\n",
    "# y~x-1: regress x on y, but leave out the intercept\n",
    "fit0 <- lm(infantMortality~1, data = un2) \n",
    "\n",
    "# fit1: dai dien cho all predictors deu != 0\n",
    "# fit0: dai dien cho all predictors deu = 0\n",
    "# su dung ANOVA de so sanh 2 model nay, if:\n",
    "# p-value < 0.05 thi 2 case nay la khac nhau hoan toan, va ket luan\n",
    "# co it nhat 1 predictor != 0\n",
    "lrt.fit1 <- anova(fit0, fit1)  # save ANOVA table\n",
    "Fval <- lrt.fit1$F[2] # extract F-value\n",
    "pval <- lrt.fit1$`Pr(>F)`[2] # extract p-value\n",
    "\n",
    "# create a column with names of the stats saved\n",
    "Statistic <- c(\"F-statistic\", \"p-value\", \"R-squared\",\"Adj. R-squared\")\n",
    "# create a column with the values of the stats\n",
    "Value <- c(Fval, pval, Rsq, AdjRsq)\n",
    "# combine columns into a dataframe\n",
    "fit1.res <- data.frame(Statistic, Value)\n",
    "\n",
    "library(pander)\n",
    "pander(fit1.res, digits=3, caption=\"Model assessment summary\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "94cef169",
   "metadata": {
    "papermill": {
     "duration": 0.004735,
     "end_time": "2023-03-11T19:43:18.663135",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.658400",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "3. a. fit a linear model of medv against crim, indus, dis and lstat as predictors. Obtain 95% CIs for the regression coefficient estimates"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "70af30d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.677556Z",
     "iopub.status.busy": "2023-03-11T19:43:18.676197Z",
     "iopub.status.idle": "2023-03-11T19:43:18.756623Z",
     "shell.execute_reply": "2023-03-11T19:43:18.755019Z"
    },
    "papermill": {
     "duration": 0.090126,
     "end_time": "2023-03-11T19:43:18.759554",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.669428",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘MASS’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    select\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|     &nbsp;      | Estimate | Std. Error | t value |  Pr(>|t|)  |\n",
      "|:---------------:|:--------:|:----------:|:-------:|:----------:|\n",
      "| **(Intercept)** |  42.84   |   1.269    |  33.75  | 4.195e-131 |\n",
      "|    **crim**     | -0.09068 |  0.03508   | -2.585  |  0.01002   |\n",
      "|    **indus**    | -0.3152  |  0.05961   | -5.287  | 1.858e-07  |\n",
      "|     **dis**     |  -1.309  |   0.1789   | -7.315  | 1.026e-12  |\n",
      "|    **lstat**    | -0.9092  |  0.04831   | -18.82  | 3.621e-60  |\n",
      "\n",
      "\n",
      "\n",
      "| Observations | Residual Std. Error | $R^2$  | Adjusted $R^2$ |\n",
      "|:------------:|:-------------------:|:------:|:--------------:|\n",
      "|     506      |        5.894        | 0.5925 |     0.5893     |\n",
      "\n",
      "Table: Summary of fitted model\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(MASS)\n",
    "data(\"Boston\")\n",
    "fit1 <- lm(medv ~ crim + indus + dis + lstat, data = Boston)\n",
    "# not equivalent fit1 <- lm(medv ~ ., data=Boston): take 12 predictors\n",
    "pander(\n",
    "    summary(fit1), \n",
    "    caption = \"Summary of fitted model\"\n",
    ")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "cbcaaf2f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.772607Z",
     "iopub.status.busy": "2023-03-11T19:43:18.771350Z",
     "iopub.status.idle": "2023-03-11T19:43:18.789566Z",
     "shell.execute_reply": "2023-03-11T19:43:18.787939Z"
    },
    "papermill": {
     "duration": 0.027742,
     "end_time": "2023-03-11T19:43:18.792397",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.764655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|     &nbsp;      | 2.5 %  | 97.5 % |\n",
      "|:---------------:|:------:|:------:|\n",
      "| **(Intercept)** | 40.35  | 45.34  |\n",
      "|    **crim**     | -0.16  | -0.022 |\n",
      "|    **indus**    | -0.432 | -0.198 |\n",
      "|     **dis**     | -1.66  | -0.957 |\n",
      "|    **lstat**    | -1.004 | -0.814 |\n",
      "\n",
      "Table: 95% CIs for regression coefficients\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(pander)\n",
    "pander( # print\n",
    "    confint(fit1),\n",
    "    round = 3,\n",
    "    caption = \"95% CIs for regression coefficients\"\n",
    ")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2715e712",
   "metadata": {
    "papermill": {
     "duration": 0.005243,
     "end_time": "2023-03-11T19:43:18.803230",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.797987",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "b. a prediction is made as shown below from the linear model fitted for the predictor values: crim=0.2, indus=9.0, dis=3.2, lstat=11.4\n",
    "\n",
    "    i. give the value of hat{medv}|crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4\n",
    "    \n",
    "    Answer: hat{medv}=25.43\n",
    "    \n",
    "    ii. give the value of E(hat{medv})|crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4\n",
    "    \n",
    "    Answer: E(hat{medv})=25.43\n",
    "    \n",
    "    iii. the code which is used to obtain an interval estimate for hat{medv}|crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4\n",
    "    \n",
    "    Answer: use interval=\"prediction\" to obtain an interval estimation for the prediction of an individual value"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "502ff639",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.816394Z",
     "iopub.status.busy": "2023-03-11T19:43:18.815087Z",
     "iopub.status.idle": "2023-03-11T19:43:18.834368Z",
     "shell.execute_reply": "2023-03-11T19:43:18.832781Z"
    },
    "papermill": {
     "duration": 0.028606,
     "end_time": "2023-03-11T19:43:18.836959",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.808353",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|  fit  |  lwr  |  upr  |\n",
      "|:-----:|:-----:|:-----:|\n",
      "| 25.43 | 13.83 | 37.03 |\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(pander)\n",
    "pander(\n",
    "    predict(\n",
    "        fit1,\n",
    "        data.frame(crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4),\n",
    "        interval=\"prediction\"\n",
    "    )\n",
    ")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f0980902",
   "metadata": {
    "papermill": {
     "duration": 0.005124,
     "end_time": "2023-03-11T19:43:18.848488",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.843364",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "iv. the code which is used to obtain an interval estimate for E(hat{medv})|crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4\n",
    "\n",
    "Answer: use interval=\"confidence\" to obtain an interval estimate for the prediction of a mean value"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "4964c6dd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-11T19:43:18.862177Z",
     "iopub.status.busy": "2023-03-11T19:43:18.860726Z",
     "iopub.status.idle": "2023-03-11T19:43:18.878168Z",
     "shell.execute_reply": "2023-03-11T19:43:18.876408Z"
    },
    "papermill": {
     "duration": 0.026656,
     "end_time": "2023-03-11T19:43:18.880371",
     "exception": false,
     "start_time": "2023-03-11T19:43:18.853715",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "|  fit  |  lwr  |  upr  |\n",
      "|:-----:|:-----:|:-----:|\n",
      "| 25.43 | 24.75 | 26.12 |\n",
      "\n"
     ]
    }
   ],
   "source": [
    "pander(\n",
    "    predict(\n",
    "        fit1, \n",
    "        data.frame(crim = 0.2, indus = 9.0, dis = 3.2, lstat = 11.4),\n",
    "        interval=\"confidence\"\n",
    "    )\n",
    ")"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 5.537762,
   "end_time": "2023-03-11T19:43:19.005583",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-11T19:43:13.467821",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
