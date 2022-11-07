{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-replace-supers?rev=104-ac9f16868a15dc6ebfd50268cd7de0f9";
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
    ident = "babel-helper-replace-supers";
    ldir  = "info/unscoped/b/babel-helper-replace-supers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
