$(function () {
    
    var $personalReferencesLink = $('.add_fields');
    var personalReference = {

        minimum: 1,

        maximum: 3,

        $personalReferences: [],

        initialize: function() {
            this.$personalReferences = [];
            var $personalReferenceDiv = $('.nested-fields');            
            var that = this;
            $personalReferenceDiv.each(function(index, personalReference) {                
                that.$personalReferences.push($(personalReference));
            });
            
            return;
        },

        add: function($personalReference) {            
            this.$personalReferences.push($personalReference);
            return;
        },      

        show: function() {            
            this.$personalReferences.forEach(function($personalReference) {
                console.log($personalReference);
            });

            return;
        },

        remove: function($personalReferenceToDestroy) {
            var that = this;
            that.$personalReferences.forEach(function($personalReference, index) {
                if ($personalReference.is($personalReferenceToDestroy)) {
                    that.$personalReferences.splice(index, 1);
                    return;
                }
                return;
            });
            return;
        },

        notDeleteFirst: function() {
            if (this.$personalReferences.length != 0) {
                $removePersonalReferenceLink = this.$personalReferences[0].find('.remove_fields');        
                $removePersonalReferenceLink.remove();
            }
            return;
        },

        size: function() {
            return this.$personalReferences.length;
        }
    };

    personalReference.initialize();
    personalReference.show();
    personalReference.notDeleteFirst();
    disableAddPersonalReferenceLink();

    $('#personal_references').on('cocoon:after-insert', function(e, insertedPersonalReference) {

        personalReference.add(insertedPersonalReference);
        personalReference.show();
        personalReference.notDeleteFirst();
        disableAddPersonalReferenceLink();

        return;
    });   

    $('#personal_references').on('cocoon:before-remove', function(e, deletedPersonalReference) {

        personalReference.remove(deletedPersonalReference);        
        if (personalReference.size() < personalReference.maximum) {
            enableAddPersonalReferenceLink($personalReferencesLink);
        }

        return;            
    });   

    function disableAddPersonalReferenceLink() {
        if (personalReference.size() >= personalReference.maximum) {
            disableAddPersonalReferenceLink($personalReferencesLink);
        }

        // Private function
        function disableAddPersonalReferenceLink($personalReferencesLink) {
            $personalReferencesLink.addClass('disabled');
            return;
        }
    }

    function enableAddPersonalReferenceLink($personalReferencesLink) {
        $personalReferencesLink.removeClass('disabled');
        return;
    }

});



