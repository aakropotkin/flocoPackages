{

  inputs.packument.url   = "https://registry.npmjs.org/inversify?rev=116-ffae0d176ccaa8262a037e6ce875ad9c";
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
    ident = "inversify";
    ldir  = "info/unscoped/i/inversify";
    inherit packument fetchInfo;
  } // latest';

}
