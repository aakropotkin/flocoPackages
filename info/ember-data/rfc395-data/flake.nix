{

  inputs.packument.url   = "https://registry.npmjs.org/@ember-data/rfc395-data?rev=6-a4ab7ebe3b92147825bc9eb26c8ccacc";
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
    scope = "@ember-data";
    ident = "@ember-data/rfc395-data";
    ldir  = "info/ember-data/rfc395-data";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
