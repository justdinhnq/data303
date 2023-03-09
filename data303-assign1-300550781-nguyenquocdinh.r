{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "91459c3f",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2023-03-09T02:51:24.651336Z",
     "iopub.status.busy": "2023-03-09T02:51:24.648480Z",
     "iopub.status.idle": "2023-03-09T02:51:26.368167Z",
     "shell.execute_reply": "2023-03-09T02:51:26.366127Z"
    },
    "papermill": {
     "duration": 1.728673,
     "end_time": "2023-03-09T02:51:26.370941",
     "exception": false,
     "start_time": "2023-03-09T02:51:24.642268",
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
      "text/html": [
       "'data303-assign1'"
      ],
      "text/latex": [
       "'data303-assign1'"
      ],
      "text/markdown": [
       "'data303-assign1'"
      ],
      "text/plain": [
       "[1] \"data303-assign1\""
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
   "id": "b6ab9eda",
   "metadata": {
    "papermill": {
     "duration": 0.00226,
     "end_time": "2023-03-09T02:51:26.375969",
     "exception": false,
     "start_time": "2023-03-09T02:51:26.373709",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "---\n",
    "title: \"DATA 303/473 Assignment 1\"\n",
    "author: \"Nokuthaba Sibanda, 301111111\"\n",
    "date: \"Due: 17 March 2023\"\n",
    "output: pdf_document\n",
    "---"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c5a0666a",
   "metadata": {
    "papermill": {
     "duration": 0.001968,
     "end_time": "2023-03-09T02:51:26.380104",
     "exception": false,
     "start_time": "2023-03-09T02:51:26.378136",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Question 1**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "573019c5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-09T02:51:26.419827Z",
     "iopub.status.busy": "2023-03-09T02:51:26.386636Z",
     "iopub.status.idle": "2023-03-09T02:51:26.602711Z",
     "shell.execute_reply": "2023-03-09T02:51:26.600585Z"
    },
    "papermill": {
     "duration": 0.223226,
     "end_time": "2023-03-09T02:51:26.605496",
     "exception": false,
     "start_time": "2023-03-09T02:51:26.382270",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>price</th><th scope=col>make</th><th scope=col>kms</th><th scope=col>fuel</th><th scope=col>seller</th><th scope=col>tx</th><th scope=col>owner</th><th scope=col>mileage</th><th scope=col>esize</th><th scope=col>power</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>75      </td><td>Other</td><td>90 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1489</td><td>35.5  </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>99      </td><td>Other</td><td>100</td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>122     </td><td>Other</td><td>60 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>200     </td><td>Other</td><td>80 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Third or above</td><td>13.5 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>300     </td><td>Other</td><td>200</td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>20.07</td><td>1461</td><td>75    </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1689.999</td><td>Other</td><td>50 </td><td>Diesel</td><td>Dealer    </td><td>Automatic</td><td>First         </td><td>18.53</td><td>1968</td><td>187.74</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & price & make & kms & fuel & seller & tx & owner & mileage & esize & power\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 75       & Other & 90  & Diesel & Individual & Manual    & Second         & 12.8  & 1489 & 35.5  \\\\\n",
       "\t2 & 99       & Other & 100 & Diesel & Individual & Manual    & Second         & 12.8  & 1995 & 52    \\\\\n",
       "\t3 & 122      & Other & 60  & Diesel & Individual & Manual    & Second         & 12.8  & 1995 & 52    \\\\\n",
       "\t4 & 200      & Other & 80  & Diesel & Individual & Manual    & Third or above & 13.5  & 1995 & 52    \\\\\n",
       "\t5 & 300      & Other & 200 & Diesel & Individual & Manual    & Second         & 20.07 & 1461 & 75    \\\\\n",
       "\t6 & 1689.999 & Other & 50  & Diesel & Dealer     & Automatic & First          & 18.53 & 1968 & 187.74\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | price &lt;chr&gt; | make &lt;chr&gt; | kms &lt;chr&gt; | fuel &lt;chr&gt; | seller &lt;chr&gt; | tx &lt;chr&gt; | owner &lt;chr&gt; | mileage &lt;chr&gt; | esize &lt;int&gt; | power &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 75       | Other | 90  | Diesel | Individual | Manual    | Second         | 12.8  | 1489 | 35.5   |\n",
       "| 2 | 99       | Other | 100 | Diesel | Individual | Manual    | Second         | 12.8  | 1995 | 52     |\n",
       "| 3 | 122      | Other | 60  | Diesel | Individual | Manual    | Second         | 12.8  | 1995 | 52     |\n",
       "| 4 | 200      | Other | 80  | Diesel | Individual | Manual    | Third or above | 13.5  | 1995 | 52     |\n",
       "| 5 | 300      | Other | 200 | Diesel | Individual | Manual    | Second         | 20.07 | 1461 | 75     |\n",
       "| 6 | 1689.999 | Other | 50  | Diesel | Dealer     | Automatic | First          | 18.53 | 1968 | 187.74 |\n",
       "\n"
      ],
      "text/plain": [
       "  price    make  kms fuel   seller     tx        owner          mileage esize\n",
       "1 75       Other 90  Diesel Individual Manual    Second         12.8    1489 \n",
       "2 99       Other 100 Diesel Individual Manual    Second         12.8    1995 \n",
       "3 122      Other 60  Diesel Individual Manual    Second         12.8    1995 \n",
       "4 200      Other 80  Diesel Individual Manual    Third or above 13.5    1995 \n",
       "5 300      Other 200 Diesel Individual Manual    Second         20.07   1461 \n",
       "6 1689.999 Other 50  Diesel Dealer     Automatic First          18.53   1968 \n",
       "  power \n",
       "1 35.5  \n",
       "2 52    \n",
       "3 52    \n",
       "4 52    \n",
       "5 75    \n",
       "6 187.74"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>price</th><th scope=col>make</th><th scope=col>kms</th><th scope=col>fuel</th><th scope=col>seller</th><th scope=col>tx</th><th scope=col>owner</th><th scope=col>mileage</th><th scope=col>esize</th><th scope=col>power</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>75      </td><td>Other</td><td>90 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1489</td><td>35.5  </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>99      </td><td>Other</td><td>100</td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>122     </td><td>Other</td><td>60 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>12.8 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>4</th><td>200     </td><td>Other</td><td>80 </td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Third or above</td><td>13.5 </td><td>1995</td><td>52    </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>300     </td><td>Other</td><td>200</td><td>Diesel</td><td>Individual</td><td>Manual   </td><td>Second        </td><td>20.07</td><td>1461</td><td>75    </td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1689.999</td><td>Other</td><td>50 </td><td>Diesel</td><td>Dealer    </td><td>Automatic</td><td>First         </td><td>18.53</td><td>1968</td><td>187.74</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & price & make & kms & fuel & seller & tx & owner & mileage & esize & power\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <int> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 75       & Other & 90  & Diesel & Individual & Manual    & Second         & 12.8  & 1489 & 35.5  \\\\\n",
       "\t2 & 99       & Other & 100 & Diesel & Individual & Manual    & Second         & 12.8  & 1995 & 52    \\\\\n",
       "\t3 & 122      & Other & 60  & Diesel & Individual & Manual    & Second         & 12.8  & 1995 & 52    \\\\\n",
       "\t4 & 200      & Other & 80  & Diesel & Individual & Manual    & Third or above & 13.5  & 1995 & 52    \\\\\n",
       "\t5 & 300      & Other & 200 & Diesel & Individual & Manual    & Second         & 20.07 & 1461 & 75    \\\\\n",
       "\t6 & 1689.999 & Other & 50  & Diesel & Dealer     & Automatic & First          & 18.53 & 1968 & 187.74\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | price &lt;chr&gt; | make &lt;chr&gt; | kms &lt;chr&gt; | fuel &lt;chr&gt; | seller &lt;chr&gt; | tx &lt;chr&gt; | owner &lt;chr&gt; | mileage &lt;chr&gt; | esize &lt;int&gt; | power &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 75       | Other | 90  | Diesel | Individual | Manual    | Second         | 12.8  | 1489 | 35.5   |\n",
       "| 2 | 99       | Other | 100 | Diesel | Individual | Manual    | Second         | 12.8  | 1995 | 52     |\n",
       "| 3 | 122      | Other | 60  | Diesel | Individual | Manual    | Second         | 12.8  | 1995 | 52     |\n",
       "| 4 | 200      | Other | 80  | Diesel | Individual | Manual    | Third or above | 13.5  | 1995 | 52     |\n",
       "| 5 | 300      | Other | 200 | Diesel | Individual | Manual    | Second         | 20.07 | 1461 | 75     |\n",
       "| 6 | 1689.999 | Other | 50  | Diesel | Dealer     | Automatic | First          | 18.53 | 1968 | 187.74 |\n",
       "\n"
      ],
      "text/plain": [
       "  price    make  kms fuel   seller     tx        owner          mileage esize\n",
       "1 75       Other 90  Diesel Individual Manual    Second         12.8    1489 \n",
       "2 99       Other 100 Diesel Individual Manual    Second         12.8    1995 \n",
       "3 122      Other 60  Diesel Individual Manual    Second         12.8    1995 \n",
       "4 200      Other 80  Diesel Individual Manual    Third or above 13.5    1995 \n",
       "5 300      Other 200 Diesel Individual Manual    Second         20.07   1461 \n",
       "6 1689.999 Other 50  Diesel Dealer     Automatic First          18.53   1968 \n",
       "  power \n",
       "1 35.5  \n",
       "2 52    \n",
       "3 52    \n",
       "4 52    \n",
       "5 75    \n",
       "6 187.74"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>region</th><th scope=col>area</th><th scope=col>palmitic</th><th scope=col>palmitoleic</th><th scope=col>stearic</th><th scope=col>oleic</th><th scope=col>linoleic</th><th scope=col>linolenic</th><th scope=col>arachidic</th><th scope=col>eicosenoic</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Southern Italy</td><td>North-Apulia</td><td>10.75</td><td>0.75</td><td>2.26</td><td>78.23</td><td>6.72</td><td>0.36</td><td>0.6 </td><td>0.29</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Southern Italy</td><td>North-Apulia</td><td>10.88</td><td>0.73</td><td>2.24</td><td>77.09</td><td>7.81</td><td>0.31</td><td>0.61</td><td>0.29</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Southern Italy</td><td>North-Apulia</td><td>9.11 </td><td>0.54</td><td>2.46</td><td>81.13</td><td>5.49</td><td>0.31</td><td>0.63</td><td>0.29</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Southern Italy</td><td>North-Apulia</td><td>9.66 </td><td>0.57</td><td>2.4 </td><td>79.52</td><td>6.19</td><td>0.5 </td><td>0.78</td><td>0.35</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Southern Italy</td><td>North-Apulia</td><td>10.51</td><td>0.67</td><td>2.59</td><td>77.71</td><td>6.72</td><td>0.5 </td><td>0.8 </td><td>0.46</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Southern Italy</td><td>North-Apulia</td><td>9.11 </td><td>0.49</td><td>2.68</td><td>79.24</td><td>6.78</td><td>0.51</td><td>0.7 </td><td>0.44</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & region & area & palmitic & palmitoleic & stearic & oleic & linoleic & linolenic & arachidic & eicosenoic\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & Southern Italy & North-Apulia & 10.75 & 0.75 & 2.26 & 78.23 & 6.72 & 0.36 & 0.6  & 0.29\\\\\n",
       "\t2 & Southern Italy & North-Apulia & 10.88 & 0.73 & 2.24 & 77.09 & 7.81 & 0.31 & 0.61 & 0.29\\\\\n",
       "\t3 & Southern Italy & North-Apulia & 9.11  & 0.54 & 2.46 & 81.13 & 5.49 & 0.31 & 0.63 & 0.29\\\\\n",
       "\t4 & Southern Italy & North-Apulia & 9.66  & 0.57 & 2.4  & 79.52 & 6.19 & 0.5  & 0.78 & 0.35\\\\\n",
       "\t5 & Southern Italy & North-Apulia & 10.51 & 0.67 & 2.59 & 77.71 & 6.72 & 0.5  & 0.8  & 0.46\\\\\n",
       "\t6 & Southern Italy & North-Apulia & 9.11  & 0.49 & 2.68 & 79.24 & 6.78 & 0.51 & 0.7  & 0.44\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | region &lt;chr&gt; | area &lt;chr&gt; | palmitic &lt;chr&gt; | palmitoleic &lt;chr&gt; | stearic &lt;chr&gt; | oleic &lt;chr&gt; | linoleic &lt;chr&gt; | linolenic &lt;chr&gt; | arachidic &lt;chr&gt; | eicosenoic &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | Southern Italy | North-Apulia | 10.75 | 0.75 | 2.26 | 78.23 | 6.72 | 0.36 | 0.6  | 0.29 |\n",
       "| 2 | Southern Italy | North-Apulia | 10.88 | 0.73 | 2.24 | 77.09 | 7.81 | 0.31 | 0.61 | 0.29 |\n",
       "| 3 | Southern Italy | North-Apulia | 9.11  | 0.54 | 2.46 | 81.13 | 5.49 | 0.31 | 0.63 | 0.29 |\n",
       "| 4 | Southern Italy | North-Apulia | 9.66  | 0.57 | 2.4  | 79.52 | 6.19 | 0.5  | 0.78 | 0.35 |\n",
       "| 5 | Southern Italy | North-Apulia | 10.51 | 0.67 | 2.59 | 77.71 | 6.72 | 0.5  | 0.8  | 0.46 |\n",
       "| 6 | Southern Italy | North-Apulia | 9.11  | 0.49 | 2.68 | 79.24 | 6.78 | 0.51 | 0.7  | 0.44 |\n",
       "\n"
      ],
      "text/plain": [
       "  region         area         palmitic palmitoleic stearic oleic linoleic\n",
       "1 Southern Italy North-Apulia 10.75    0.75        2.26    78.23 6.72    \n",
       "2 Southern Italy North-Apulia 10.88    0.73        2.24    77.09 7.81    \n",
       "3 Southern Italy North-Apulia 9.11     0.54        2.46    81.13 5.49    \n",
       "4 Southern Italy North-Apulia 9.66     0.57        2.4     79.52 6.19    \n",
       "5 Southern Italy North-Apulia 10.51    0.67        2.59    77.71 6.72    \n",
       "6 Southern Italy North-Apulia 9.11     0.49        2.68    79.24 6.78    \n",
       "  linolenic arachidic eicosenoic\n",
       "1 0.36      0.6       0.29      \n",
       "2 0.31      0.61      0.29      \n",
       "3 0.31      0.63      0.29      \n",
       "4 0.5       0.78      0.35      \n",
       "5 0.5       0.8       0.46      \n",
       "6 0.51      0.7       0.44      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cardekho <- read.csv2(\"/kaggle/input/data303-assign1/cardekho.csv\", header = TRUE, sep = \",\")\n",
    "head(cardekho)\n",
    "\n",
    "cardekho2 <- read.csv2(\"/kaggle/input/data303-assign1/cardekho2.csv\", header = TRUE, sep = \",\")\n",
    "head(cardekho2)\n",
    "\n",
    "olive <- read.csv2(\"/kaggle/input/data303-assign1/olive.csv\", header = TRUE, sep = \",\")\n",
    "head(olive)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f0765011",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-09T02:51:26.616165Z",
     "iopub.status.busy": "2023-03-09T02:51:26.614416Z",
     "iopub.status.idle": "2023-03-09T02:51:26.640969Z",
     "shell.execute_reply": "2023-03-09T02:51:26.638925Z"
    },
    "papermill": {
     "duration": 0.034713,
     "end_time": "2023-03-09T02:51:26.643618",
     "exception": false,
     "start_time": "2023-03-09T02:51:26.608905",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    price               make               kms                fuel          \n",
       " Length:8028        Length:8028        Length:8028        Length:8028       \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "    seller               tx               owner             mileage         \n",
       " Length:8028        Length:8028        Length:8028        Length:8028       \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "     esize         power          \n",
       " Min.   : 624   Length:8028       \n",
       " 1st Qu.:1197   Class :character  \n",
       " Median :1248   Mode  :character  \n",
       " Mean   :1463                     \n",
       " 3rd Qu.:1582                     \n",
       " Max.   :3604                     \n",
       " NA's   :214                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Q1. a. \n",
    "summary(cardekho)\n",
    "\n",
    "# Q1. a. i)"
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
   "duration": 5.924391,
   "end_time": "2023-03-09T02:51:26.770286",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-09T02:51:20.845895",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
