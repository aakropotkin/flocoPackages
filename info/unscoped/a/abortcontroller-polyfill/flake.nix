{

  inputs.packument.url   = "https://registry.npmjs.org/abortcontroller-polyfill?rev=41-213bb2ad74866523901c599632d3bc01";
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
    ident = "abortcontroller-polyfill";
    ldir  = "info/unscoped/a/abortcontroller-polyfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
