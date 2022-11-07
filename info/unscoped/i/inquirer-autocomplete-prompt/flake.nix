{

  inputs.packument.url   = "https://registry.npmjs.org/inquirer-autocomplete-prompt?rev=35-b45de38b99ef2929704a6b5cdb74105b";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "inquirer-autocomplete-prompt";
    ldir  = "info/unscoped/i/inquirer-autocomplete-prompt";
    inherit packument fetchInfo;
  } // latest';

}
