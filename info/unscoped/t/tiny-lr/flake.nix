{

  inputs.packument.url   = "https://registry.npmjs.org/tiny-lr?rev=92-87914da60013754e7f8da96b91823a34";
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
    ident = "tiny-lr";
    ldir  = "info/unscoped/t/tiny-lr";
    inherit packument fetchInfo;
  } // latest';

}
