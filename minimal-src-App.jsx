import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { HelmetProvider } from 'react-helmet-async';
import { ThemeProvider, StyledEngineProvider } from '@mui/material/styles';
import questTheme from 'src/QuestUiKitLightTheme';
import SampleCard from 'src/components/SampleCard/SampleCard';

function App() {
  return (
    <HelmetProvider>
      <StyledEngineProvider injectFirst>
        <ThemeProvider theme={questTheme}>
          <Routes>
            <Route path="/" element={<SampleCard post={
              {
                 title   : 'Title Neil 3',
                 content : 'Content Neil was here three.',
                 image   : 'url(https://babyapps.io/test-1/wp-content/uploads/sites/14/2023/01/8344BA1F-CBA1-4E95-846C-66C913A43E30-2-scaled.jpeg)'
              }
            } />} />
          </Routes>
        </ThemeProvider>
      </StyledEngineProvider>
    </HelmetProvider>
  );
}

export default App;
