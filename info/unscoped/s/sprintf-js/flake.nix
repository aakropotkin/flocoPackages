{

  inputs.packument.url   = "https://registry.npmjs.org/sprintf-js?rev=84-dfd9f44c510ff1aeb5708d40953d00ef";
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
    ident = "sprintf-js";
    ldir  = "info/unscoped/s/sprintf-js";
    inherit packument fetchInfo;
  } // latest';

}
