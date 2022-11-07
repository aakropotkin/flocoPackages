{

  inputs.packument.url   = "https://registry.npmjs.org/private?rev=39-1b1b8332874d6c03af8e5992a1d65119";
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
    ident = "private";
    ldir  = "info/unscoped/p/private";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
