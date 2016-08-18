var gulp = require("gulp"),
    nodemon = require("gulp-nodemon"),
    gulpMocha = require("gulp-mocha"),
    env = require("gulp-env"),
    supertest = require("supertest");
    
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
    gulp.src('test/*.coffee', {read: false})
        .pipe(gulpMocha({reporter: 'nyan'}));
});