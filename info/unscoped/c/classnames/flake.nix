{

  inputs.packument.url   = "https://registry.npmjs.org/classnames?rev=276-1f707948142a62023690aae74488c9bd";
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
    ident = "classnames";
    ldir  = "info/unscoped/c/classnames";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
