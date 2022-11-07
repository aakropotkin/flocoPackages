{

  inputs.packument.url   = "https://registry.npmjs.org/spdy-transport?rev=59-d95fd6d41c65abcfef62f5c57b25c5a4";
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
    ident = "spdy-transport";
    ldir  = "info/unscoped/s/spdy-transport";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
