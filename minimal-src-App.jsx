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
                 title   : 'Lorem Ipsum',
                 content : 'Lorem ipsum test to be seen and not read for placement only. Lorem ipsum test to be seen.',
                 image   : 'url(/assets/images/SampleCard_Image.png)'
              }
            } />} />
          </Routes>
        </ThemeProvider>
      </StyledEngineProvider>
    </HelmetProvider>
  );
}

export default App;
