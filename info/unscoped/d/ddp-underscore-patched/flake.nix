{

  inputs.packument.url   = "https://registry.npmjs.org/ddp-underscore-patched?rev=4-0bfe9241e8607dc0550ed130d768efa7";
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
    ident = "ddp-underscore-patched";
    ldir  = "info/unscoped/d/ddp-underscore-patched";
    inherit packument fetchInfo;
  } // latest';

}
