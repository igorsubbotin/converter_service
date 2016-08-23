var gulp = require("gulp"),
    nodemon = require("gulp-nodemon"),
    gulpMocha = require("gulp-mocha"),  
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    env = require("gulp-env"),
    supertest = require("supertest");
require('coffee-script/register');
    
gulp.task('default', function() {
    env({vars: {ENV: 'Dev'}});
    nodemon({
         script: 'app.js',
         ext: 'js',
         env: {
             PORT: 8000
         },
         ignore: ['./node_modules/**']
    })
    .on('restart', function(){
         console.log('Restarting');
    });
});

gulp.task('test', function() {
    env({vars: {ENV: 'Test'}});
    gulp.src('test/**/*.coffee', {read: false})
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulpMocha({reporter: 'nyan'}));
});

gulp.task('test-watch', function() {
    gulp.watch(['./**/*.js', 'test/**/*.coffee'], ['test']);
})