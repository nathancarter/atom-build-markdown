/* globals atom:false */

'use strict';

exports.provideBuilder = function () {
  return class WeaveBuilder {

    getNiceName() {
      return 'Weave.jl';
    }

    isEligible() {
      var textEditor = atom.workspace.getActiveTextEditor();
      if (!textEditor || !textEditor.getPath()) {
        return false;
      }
      return textEditor.getPath().endsWith('.jmd');
    }

    settings() {
      return [ {
        name: 'Weave.jl: build',
        exec: 'echo',
        args: [ 'THIS IS NOT YET IMPLEMENTED' ]
      }];
    }
  }
};
