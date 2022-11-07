{

  inputs.packument.url   = "https://registry.npmjs.org/nyc?rev=321-d61dad10a96d8e741feca75d2dfe1bb4";
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
    ident = "nyc";
    ldir  = "info/unscoped/n/nyc";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
