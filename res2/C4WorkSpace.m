//
//  C4WorkSpace.m
//  res2
//
//  Created by Greg Debicki on 12-05-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    
    NSMutableArray *textArray;
    C4Font *font;
    C4Movie *newMovie;
    float newTime;
}

-(void)setup {
    
    newTime = 0.0f;
    newMovie = [[C4Movie alloc] initWithMovieName:@"IMG_0031.MOV"];
    newMovie.center = CGPointMake(384,512);
    
    [self.canvas addMovie:newMovie];
    newMovie.transform = CGAffineTransformMakeRotation(PI/2);
    newMovie.frame = self.canvas.frame;
    newMovie.loops = YES;
    newMovie.userInteractionEnabled = NO;
    
    
    font = [C4Font fontWithName: @"Helvetica" size:30];
    textArray = [[NSMutableArray alloc] initWithCapacity:0];
    for(int i = 0; i < 17; i++){
        C4Shape *s = [C4Shape shapeFromString:@"." withFont:font];
        s.animationDuration = 0.0f;
        s.origin = CGPointMake(100, 200 + 20 * i);
        s.fillColor = [UIColor colorWithWhite:0 alpha:1];
        s.strokeColor = [UIColor colorWithWhite:0 alpha:0];
        
        [textArray addObject:s];
        [self.canvas addShape:s];
    }
    
    [(C4Shape *)[textArray objectAtIndex:0] shapeFromString:@"Revolution" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:1] shapeFromString:@"sounds" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:2] shapeFromString:@"very" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:3] shapeFromString:@"romantic" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:4] shapeFromString:@"you" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:5] shapeFromString:@"know" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:6] shapeFromString:@"but" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:7] shapeFromString:@"it" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:8] shapeFromString:@"ain't" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:9] shapeFromString:@"it's" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:10] shapeFromString:@"men" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:11] shapeFromString:@"torturing" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:12] shapeFromString:@"men" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:13] shapeFromString:@"who" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:14] shapeFromString:@"used" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:15] shapeFromString:@"to" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:16] shapeFromString:@"laugh" withFont:font];
    //quote by Bukowski
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [newMovie pause];
    
    for(int i = 0; i < 17; i++){
        C4Shape *s = [textArray objectAtIndex:i];
        s.animationDuration = 1.0f;
        if(i == 6 || i == 8) {
            if (i == 6){s.origin = CGPointMake(600, 500 + 21 * (i+1));}
            else{s.origin = CGPointMake(600, 500 + 21 * (i-1));}
        }
        else{
            s.origin = CGPointMake(500, 500 + 21 * i);
        }
    }
    
    [(C4Shape *)[textArray objectAtIndex:0] shapeFromString:@"Revolution" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:1] shapeFromString:@"    is" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:2] shapeFromString:@"      very" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:3] shapeFromString:@"  romantic" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:4] shapeFromString:@"       you" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:5] shapeFromString:@"      know" withFont:font];
    [[textArray objectAtIndex:6] shapeFromString:@"." withFont:font];
    [[textArray objectAtIndex:7] shapeFromString:@"        ." withFont:font];
    [[textArray objectAtIndex:8] shapeFromString:@"    ." withFont:font];
    [(C4Shape *)[textArray objectAtIndex:9] shapeFromString:@"      it's" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:10] shapeFromString:@"       men" withFont:font];    
    [[textArray objectAtIndex:11] shapeFromString:           @"  tickling" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:12] shapeFromString:@"    men" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:13] shapeFromString:@"       who" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:14] shapeFromString:@"      used" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:15] shapeFromString:@"       to" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:16] shapeFromString:@"     laugh" withFont:font];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self.canvas];
    newTime = (touchLocation.x / self.canvas.frame.size.width) * newMovie.duration;
    [newMovie seekToTime:newTime];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [newMovie play];
    for(int i = 0; i < 17; i++){
        C4Shape *s = [textArray objectAtIndex:i];
        s.origin = CGPointMake(100, 200 + 20 * i);
    }
    [(C4Shape *)[textArray objectAtIndex:0] shapeFromString:@"Revolution" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:1] shapeFromString:@"sounds" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:2] shapeFromString:@"very" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:3] shapeFromString:@"romantic" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:4] shapeFromString:@"you" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:5] shapeFromString:@"know" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:6] shapeFromString:@"but" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:7] shapeFromString:@"it" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:8] shapeFromString:@"ain't" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:9] shapeFromString:@"it's" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:10] shapeFromString:@"men" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:11] shapeFromString:@"torturing" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:12] shapeFromString:@"men" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:13] shapeFromString:@"who" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:14] shapeFromString:@"used" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:15] shapeFromString:@"to" withFont:font];
    [(C4Shape *)[textArray objectAtIndex:16] shapeFromString:@"laugh" withFont:font];
}





@end