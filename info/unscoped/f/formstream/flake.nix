{

  inputs.packument.url   = "https://registry.npmjs.org/formstream?rev=31-8d6ac1959cd912ada52dd7f247b2c275";
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
    ident = "formstream";
    ldir  = "info/unscoped/f/formstream";
    inherit packument fetchInfo;
  } // latest';

}
