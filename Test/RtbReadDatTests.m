classdef RtbReadDatTests < matlab.unittest.TestCase
    
    methods (Test)
        
        function testReadDatBadFileNoCrash(testCase)
            try
                [imageData, imageSize, lens] = ReadDAT('no-good.dat');
            catch
                imageData = [];
                imageSize = [];
                lens = [];
            end
            testCase.assertEmpty(imageData);
            testCase.assertEmpty(imageSize);
            testCase.assertEmpty(lens);
        end
        
        function testReadDat(testCase)
            datFile = fullfile(RenderToolboxRoot(), 'Test', 'Fixture', 'CoordinatesTest.dat');
            [imageData, imageSize] = ReadDAT(datFile);
            
            testCase.assertSize(imageData, [240 320 32]);
            testCase.assertTrue(max(imageData(:)) > 0);
            testCase.assertEqual(imageSize, [240 320 32]);
        end
        
        function testReadDatMaxPlanes(testCase)
            datFile = fullfile(RenderToolboxRoot(), 'Test', 'Fixture', 'CoordinatesTest.dat');
            [imageData, imageSize] = ReadDAT(datFile, ...
                'maxPlanes', 11);
            
            testCase.assertSize(imageData, [240 320 11]);
            testCase.assertTrue(max(imageData(:)) > 0);
            testCase.assertEqual(imageSize, [240 320 11]);
        end
    end
end
